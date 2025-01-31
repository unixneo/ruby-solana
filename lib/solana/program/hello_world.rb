module Solana
  module Program
    class HelloWorld < Base
      PROGRAM_ID = '67mPYhRBVCByzLvaeb1AqDdJrYaUXXMqsW7YUPjyfYbx'
      SYSVAR_RENT_ID = 'SysvarRent111111111111111111111111111111111'

      INSTRUCTION_LAYOUTS = {
        # transfer
        2 => {
          instruction: :uint32,
          lamports: :near_int64
        }
      }

      class << self
        def transfer_instruction(from_pubkey:, to_pubkey:, lamports:)
          fields = INSTRUCTION_LAYOUTS[2]
          data = encode_data(fields, {instruction: 2, lamports: lamports})

          keys = [
            { pubkey: from_pubkey, is_signer: true, is_writable: true },
            { pubkey: to_pubkey, is_signer: false, is_writable: false}
          ]

          represent(keys, data)
        end
      end
    end
  end
end
