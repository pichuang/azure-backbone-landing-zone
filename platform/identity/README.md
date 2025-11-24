# Identity Subscirption

這個訂用帳戶是用來託管傳統 Active Directory Domain Services (AD DS) 基礎設施的Tier 0 (最高安全等級) 區域。即便企業大量使用 Microsoft Entra ID (Azure AD)，大多數企業仍需維護 AD DS 以支援傳統應用程式 (Kerberos/NTLM) 和伺服器管理。

## 核心服務清單

- Windows Server VMs (AD DS Domain Controllers)
  - 用途： 延伸地端 AD 到雲端，提供較低的驗證延遲並作為備援。通常會部署至少兩台 DC (跨 Availability Zones)。

- Azure Key Vault (Identity 專用)
  - 用途： 存放 AD 管理員密碼、網域憑證、或用於 Domain Join 的帳號憑證。

- Jumpbox / Admin Workstations (PAW)
  - 用途： 如果未採用 Azure Bastion 或需要專用的管理主機來執行 AD 管理工具 (RSAT)，這些高強度的管理跳板機應放在此處。

## vnet

會有獨立的 identity vnet