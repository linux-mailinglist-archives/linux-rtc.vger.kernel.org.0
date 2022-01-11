Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A2A48BB20
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jan 2022 23:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346692AbiAKW55 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 Jan 2022 17:57:57 -0500
Received: from mail-bn8nam11on2047.outbound.protection.outlook.com ([40.107.236.47]:4900
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346723AbiAKW5z (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 11 Jan 2022 17:57:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPRBzBhDUuE9oPBgwC8ZWo76xrHySYQm+SdUCNLMOq8GUAHNwolqqZc2oEt7aDJzgNN2+1uOYX1Ml+5X1ffQqKAFQB/KhQVj+h4qr9et0cLhvY8oifwM7cB1WeyZ3tCzkqWN2bEduqDXkbTu/Y5U3dFHsKYSH+LRq4PXdLIo4JJv25dt+K9spx2sZReAq/HGKdAnokiBSN5GFbUfIyj5yeZzbPWLyq7pnl3rzvui0nz3okYit2/d1uk9IvBqpufdk+KnqtRnhrul63lWjv6DuZlPtc3Us3EsrKCCKgfvuwVbOn7ntb/2eny0rTDKw9DU+IIJnpJIUS7mZAxnPnarXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAlrhu/l1a5eqiKMjGnVwpIvefaXQOxhkY2zwX52gEw=;
 b=hFa4cOGw1WwTtC6eLxQpshIoJeuAZ6yqq1kYtjHs8ZcnM97hgC+ZepOiXbBuiGchFgthOuUjuNokLEOA5+Qv8yD2iTeS8jz0v0+LeO3aXC22RLmMMtNNuhdoZdwlNaSzpbxkNMRFrQdbd8DLACw+ynCjgn/hCc3VB4rTJyA34yj/tu2c71kvaMREfPlpDRI/BNORv/VpadZxXbuJV6jAM29XLvbFpm58aIpk1LAa8hKZ+oJJfuFVQMI9gW5UNZtKpIDzWuNUta9D+jV7boMlclqtqb9ZxfwI0wqXrbmIfCAJm6p84HMk3mr9pU3OiIOOsaaaZ2RbwPXpuC2Av7nzAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=towertech.it smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAlrhu/l1a5eqiKMjGnVwpIvefaXQOxhkY2zwX52gEw=;
 b=yU27ytoov7eNrJi6Q6UA2wndj2A3ZmfOcesXInRLrMKuj9yfSX6p4UPiVVaFxLH351Jrr3S1ZrSNeDfOmUjJYFGbh39LrmjqbXD/KKcqArvKY+rYpEDAHZ4+S188vN07W4sUOkcmBGRo888ZdurbXuhnF26QbJQedMQgcORLpKI=
Received: from DM5PR21CA0044.namprd21.prod.outlook.com (2603:10b6:3:ed::30) by
 BL1PR12MB5078.namprd12.prod.outlook.com (2603:10b6:208:313::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.12; Tue, 11 Jan
 2022 22:57:53 +0000
Received: from DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ed:cafe::80) by DM5PR21CA0044.outlook.office365.com
 (2603:10b6:3:ed::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.1 via Frontend
 Transport; Tue, 11 Jan 2022 22:57:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT013.mail.protection.outlook.com (10.13.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Tue, 11 Jan 2022 22:57:53 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 11 Jan
 2022 16:57:52 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Jinke Fan <fanjinke@hygon.cn>,
        Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
        Raul E Rangel <rrangel@chromium.org>
Subject: [PATCH] rtc: Fix the AltCentury for AMD platforms
Date:   Tue, 11 Jan 2022 16:57:50 -0600
Message-ID: <20220111225750.1699-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a78f4e4a-76ac-4eb0-e5c9-08d9d555cc98
X-MS-TrafficTypeDiagnostic: BL1PR12MB5078:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB50785FD3887ADA9923933B54E2519@BL1PR12MB5078.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: si76Zr0OitDIXpcSabsr4IhF7twnoxor7BVPmHrSOdsqZE0RMoBK8of7lq3s8rZbwyHGxDy6neQD4mcwiVbEkXJGRZtQ+1FMxRiwpX0d5bFt/dfkhAhXCqM/nFIQhr6aVG50+BlR6ZuSaK7QuyJcHgHQUNgyP5XJrEa4kYaA/v5V10rnLf6DrgKzqNkZkxH1FKUCxDhoVbZE7vm3XJlSboAk2eCsDxTnE90qPiPsPcPODiviapzCmswslcFWSB/Yxwpn8pzCRAKGT88XKOlPkBOmlTm+tzQe7xXaPYvCUXoCJAqjXouR3ItIKDBpkZwQHpUI/8CqcLQGRnjHdvB3D4rja+9xxfJh9ow8E18xlOIkOZTJdDXHb3Z+T4sU49+OQtTSQ65LkHSL+ntkgVDrMzzurJj2xCCEy8EJWYMISEoDH3v2yZ68pUDonMUX53gtWK2rEZoBIlhylUhBZMjw2PDFdKlvWgcCfNYGf4DiUzUodaHYN3at+QI3IAc2spq5dvLwCdGauFacYHLVE1/Ne5SNFzrfeTCauYxoqCbAx6xkaVv5p0L/TPlcGUg/bjI3YFKFEc9ybokbaGvXFdYoNl8DLlS2l8yXQkKcjT+wzrGihKiwwHZFYQvoXl7sb10HNt5HXwYd28Y2WqLVqmK6yaeQqvL4l+kiloGXPgMkemPjL/8aW0ftPvbqQ1LgYlG3QGZZVUa0aQ7MDU0iwfOEaOv1aMfp0dHh6gzWKpMrPfzfWBHEPsfU9Oj8EX91NYAmniY+NhyQPmkHOvw1fKB7pRIa/xLskczfl6JQ8X8Oeev2lEYp+/S1vYYYPGi2vqCrt6b/YBZ98/eEkTF309foILOJ9b/F1wUU1eqzUwAxLIxuzDPGG/wb3SCJXzm0LPiM7KzKSvHlleZN6KmK/jSgzD0TusEiyb8AMkaD0FcwwAc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(54906003)(110136005)(81166007)(82310400004)(1076003)(8936002)(36756003)(8676002)(316002)(16526019)(356005)(36860700001)(2616005)(44832011)(26005)(186003)(966005)(336012)(47076005)(508600001)(426003)(83380400001)(86362001)(70206006)(70586007)(7696005)(2906002)(5660300002)(40460700001)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 22:57:53.0363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a78f4e4a-76ac-4eb0-e5c9-08d9d555cc98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5078
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Setting the century forward has been failing on AMD platforms.
There was a previous attempt at fixing this for family 0x17 as part of
commit 7ad295d5196a ("rtc: Fix the AltCentury value on AMD/Hygon
platform") but this was later reverted due to some problems reported
that appeared to stem from an FW bug on a family 0x17 desktop system.

The same comments mentioned in the previous commit continue to apply
to the newer platforms as well.

```
MC146818 driver use function mc146818_set_time() to set register
RTC_FREQ_SELECT(RTC_REG_A)'s bit4-bit6 field which means divider stage
reset value on Intel platform to 0x7.

While AMD/Hygon RTC_REG_A(0Ah)'s bit4 is defined as DV0 [Reference]:
DV0 = 0 selects Bank 0, DV0 = 1 selects Bank 1. Bit5-bit6 is defined
as reserved.

DV0 is set to 1, it will select Bank 1, which will disable AltCentury
register(0x32) access. As UEFI pass acpi_gbl_FADT.century 0x32
(AltCentury), the CMOS write will be failed on code:
CMOS_WRITE(century, acpi_gbl_FADT.century).

Correct RTC_REG_A bank select bit(DV0) to 0 on AMD/Hygon CPUs, it will
enable AltCentury(0x32) register writing and finally setup century as
expected.
```

However in closer examination the change previously submitted was also
modifying bits 5 & 6 which are declared reserved in the AMD documentation.
So instead modify just the DV0 bank selection bit.

Being cognizant that there was a failure reported before, split the code
change out to a static function that can also be used for exclusions if
any regressions such as Mikhail's pop up again.

Cc: Jinke Fan <fanjinke@hygon.cn>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Link: https://lore.kernel.org/all/CABXGCsMLob0DC25JS8wwAYydnDoHBSoMh2_YLPfqm3TTvDE-Zw@mail.gmail.com/
Link: https://www.amd.com/system/files/TechDocs/51192_Bolton_FCH_RRG.pdf
Signed-off-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/rtc/rtc-mc146818-lib.c | 16 +++++++++++++++-
 include/linux/mc146818rtc.h    |  2 ++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
index dcfaf09946ee..3c8be2136703 100644
--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -120,6 +120,17 @@ unsigned int mc146818_get_time(struct rtc_time *time)
 }
 EXPORT_SYMBOL_GPL(mc146818_get_time);
 
+/* AMD systems don't allow access to AltCentury with DV1 */
+static bool apply_amd_register_a_behavior(void)
+{
+#ifdef CONFIG_X86
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
+	    boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
+		return true;
+#endif
+	return false;
+}
+
 /* Set the current date and time in the real time clock. */
 int mc146818_set_time(struct rtc_time *time)
 {
@@ -191,7 +202,10 @@ int mc146818_set_time(struct rtc_time *time)
 	save_control = CMOS_READ(RTC_CONTROL);
 	CMOS_WRITE((save_control|RTC_SET), RTC_CONTROL);
 	save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
-	CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
+	if (apply_amd_register_a_behavior())
+		CMOS_WRITE((save_freq_select & ~RTC_AMD_BANK_SELECT), RTC_FREQ_SELECT);
+	else
+		CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
 
 #ifdef CONFIG_MACH_DECSTATION
 	CMOS_WRITE(real_yrs, RTC_DEC_YEAR);
diff --git a/include/linux/mc146818rtc.h b/include/linux/mc146818rtc.h
index 0661af17a758..1e0205811394 100644
--- a/include/linux/mc146818rtc.h
+++ b/include/linux/mc146818rtc.h
@@ -86,6 +86,8 @@ struct cmos_rtc_board_info {
    /* 2 values for divider stage reset, others for "testing purposes only" */
 #  define RTC_DIV_RESET1	0x60
 #  define RTC_DIV_RESET2	0x70
+   /* In AMD BKDG bit 5 and 6 are reserved, bit 4 is for select dv0 bank */
+#  define RTC_AMD_BANK_SELECT	0x10
   /* Periodic intr. / Square wave rate select. 0=none, 1=32.8kHz,... 15=2Hz */
 # define RTC_RATE_SELECT 	0x0F
 
-- 
2.25.1

