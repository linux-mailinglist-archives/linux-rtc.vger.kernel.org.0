Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5767B2F4A2B
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Jan 2021 12:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbhAML3W (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Jan 2021 06:29:22 -0500
Received: from mail-eopbgr80052.outbound.protection.outlook.com ([40.107.8.52]:48198
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726562AbhAML3V (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 13 Jan 2021 06:29:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiahuNXx5GCsuLboo9WPwPNupUWSvFHDzN2uW1526SA3b0kmJvhHh9yM91BuY0IrdX4ivcbiBD/gE3UROu9KeW45kws1G83YVlkdR7BtZMrf2EXJ6CfDapt2XKgwnSdHjvLtI2zpkEpn+liSUirdVv7DfN8vVIY3WBa22bIkWVSBGPQ+yp2yi7WyYBZRcT+D5pdzrwQUvkMBWweIh9Suq1GqnUOmtMqQNWAPRcHDczfRFge74vwBgfVxFc7rNKahiNM7agF2aEN2QdtIoFT2RnunwMnDde8nUbruE5DXF4HlkgCTYP8LpY9N7FRHB7bcApYYW/mWdMI/6twbHFb3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI8Kwix1NSDkOXNOFp5xYR5pWzBdNhQfj5UqjA2NQlk=;
 b=QZeAOdV6uJJMhay8z+ysiNAWgtIb2malTTBJ90QacHlo8hBkntJfZCbTIVCQZfnBO6U1dvMtHdDVMTgo8qKaxiYnu4PQKkESGSo1u4iQwhRvXfRJD+lqoDum5qxfn5QKzRvJnlJWLL5MwSiuridjiV7ttdWME7fAcuPm5RnACDub3qKq1yqXx24dWfpd/MveHqoVesXobDadyCO7EoAcVOiQui1bRnWeniFG/K9EDqESj7kSNREPB6c3WhYKHzCIs+JQo0l+fiytvOKbHnSAy90PRMw8pK8FG8tkJimfMSnVo0o6QDbEskFLn1MTlnvtGxI8Z5QXaUsDIG/d+mdVBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI8Kwix1NSDkOXNOFp5xYR5pWzBdNhQfj5UqjA2NQlk=;
 b=Eu412hnHaxiXYYCPdhhIXLLwOfxVkvnToUyOEQO5mDzXl7sObUPlKnw1UHwZZkbPhUorK2Qo/2ANSfWZA7CxDNaSxSrTaxZdi73N7UWy7lpLNP4tFuxsOZUZ/fbBeIodOE2ihdBE8REkS6Eyw4uLDUCab2dIzbf6VaO60bu1Pbc=
Authentication-Results: kunbus.com; dkim=none (message not signed)
 header.d=none;kunbus.com; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM9P193MB0903.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 13 Jan
 2021 11:28:32 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 11:28:32 +0000
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc:     p.rosenberger@kunbus.com, dan.carpenter@oracle.com,
        u.kleine-koenig@pengutronix.de, biwen.li@nxp.com, lvb@xiphos.com,
        bruno.thomsen@gmail.com, l.sanfilippo@kunbus.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] rtc: pcf2127: proper initialization after power loss
Date:   Wed, 13 Jan 2021 12:27:40 +0100
Message-Id: <20210113112742.7354-1-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [87.130.101.138]
X-ClientProxiedBy: AM0PR01CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::19) To AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fd::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kun-nb-112.kunbus.com (87.130.101.138) by AM0PR01CA0078.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Wed, 13 Jan 2021 11:28:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20d70320-bcf2-4cde-d1ca-08d8b7b65bd2
X-MS-TrafficTypeDiagnostic: AM9P193MB0903:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9P193MB0903847AD086BF0FCB1131609FA90@AM9P193MB0903.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dyf58pwsg/eJ+YIsuy39+Xek+/rN0e43hLu8y5bEMNYjCxmArZ4q+h9ulpz8R03qBAkQxRjZaPTjf8feErXCuzj4Ykjuo0rvbnodMj6NET1JjnQEfysJs38PyR/QvoPOUE/IAp0v0ds+yrk2fw4LUJAGpI9aN959NONbS1lij6aKt+AqlHYMFhzQj9i7QVVzKVrBXallZ/VjY3+LbPAmqVCx1W4fqnPPDACASO9FRz3AzkM6VywwmKltujiLSapIAoHrEHSLhM5EkUU1ET9oHklz+Gfu/6WB9OaKirlzySmx7v9kSMcmu55nsU8Xu1mu44cJtHWy+BohXc8nBbCbh9snReiUBbc19MwxrXMcoxUYOUSRh9oEU5PdpGUCQuuVrNBQUdC0WVUqIFQk22ODcbOBCmpUwRJrAdwXAbrPPAj/hUNVXokmIx0+xGKj6KAN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(39830400003)(396003)(136003)(366004)(376002)(66476007)(52116002)(6666004)(2616005)(478600001)(66556008)(54906003)(36756003)(5660300002)(1076003)(956004)(66946007)(186003)(7696005)(8936002)(26005)(16526019)(86362001)(316002)(6486002)(83380400001)(2906002)(8676002)(4326008)(109986005)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PVsONQSgxK7PwG7/Y/Dtx3irSyHzy5H7CItLW2OVQnJDH5P+VMuC9WGWO7df?=
 =?us-ascii?Q?oMgqvL43Wug5JyH81RjaaZ0CJNDKwXZqSE8P3vgB+6KFaKBsu9TV/CcsHhYe?=
 =?us-ascii?Q?jAjvLSWV/emFxSuhl4VtkFni0xpZ+tutIaAkv3fMxq7MLU5e2uvkHy/3KRS/?=
 =?us-ascii?Q?O27Nw+AdmSjyYOjAJ7zUOIcTY9WcCuS+yBFXFka7pSyC9AoBIrlABAZFwTu+?=
 =?us-ascii?Q?MgYI+nu/jFU5eRQ5I0toii9s/EBkvNl85GRvAHMPBZVGDh3oF1PMt/n0t/W2?=
 =?us-ascii?Q?oO/WK7Catv3tyfR89TwPWy6ej6S2OW9PaPQT+I9y0V/j+E1TaDKIENjtscmn?=
 =?us-ascii?Q?55BcdVvz1gJiTcn61CHpExJyQ/A0yBp7zvsu+lN2RVlyDOEOZXPHOMkYkw1p?=
 =?us-ascii?Q?Uac+RBejVJ2TkhN1EVetFBFahNEvHvWuBClPy1o2qo1g7l/oVB8WwL+1idxY?=
 =?us-ascii?Q?C1G2PtxcS16rcBH8HCwVPnA9r4PPZBZgh5AbjwVGhO0JhDoqphe0l0z3v/cW?=
 =?us-ascii?Q?3yb+bk+D1kfLQI5YJc1RkaYp/VWeKBYhUOk6McwisMU403he/UKB5xuwK/Kh?=
 =?us-ascii?Q?xcDTeRbvhIlMfOIwFPEqelyCYwCHBOcRBNkWeSOyID9lLgepukrgxp9bS72X?=
 =?us-ascii?Q?yKN8ddENyszVq2dEj60alx5Iruhth37gIkF2IQmQ7HuqhET8b507eNduSOTv?=
 =?us-ascii?Q?1IuBjcVfDkDm90ykjFHsfWGyXz+HZ/mnmZkOGvQuEU5O2eNFkGToyTSDpJBH?=
 =?us-ascii?Q?PxMHrd9e8QvPkfGUG7vLgT92auJHXXhNFmvzbDTy0/l/1C61BN9Ge2hb5Wt/?=
 =?us-ascii?Q?5P8G5sLmpGRc03QzjtIGC4SdAGhiXaDZV7+oUHmUKc8PHPAdFX42weZwvpG2?=
 =?us-ascii?Q?NYZzEp/7dDc+rYFy4OcdCTzJNrsRMxurm4b1qSnjgmikEUnvUCoKVyaPw0X0?=
 =?us-ascii?Q?H1iczg57RANk7J3Q0GtsbSdrSEjI1y4XH1v8TcgLEY1uPPyl8wr9Ee+lCYcr?=
 =?us-ascii?Q?NmdR?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 11:28:32.4811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d70320-bcf2-4cde-d1ca-08d8b7b65bd2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOcd7lcYuCasgnDcUgy+3vDs2ES94aQdptWzsyI0o46SLN+pDy1+/C7My/m4x1klq/swmS3KVnYCm9oR5cq9UADL/aJkJeCKZc4XZ1Vi90U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB0903
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

If the PCF2127/2129 loses power it needs some initialization to work
correctly. A bootloader/firmware might do this. If not we should do this
in the driver.

Changes for v2:
- make commit log and comments more clear
- check if PORO was really disabled

Philipp Rosenberger (2):
  rtc: pcf2127: Disable Power-On Reset Override
  rtc: pcf2127: Run a OTP refresh if not done before

 drivers/rtc/rtc-pcf2127.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

Interdiff against v1:
diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index f012b989f2f2..ca56dba64e79 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -26,6 +26,7 @@
 
 /* Control register 1 */
 #define PCF2127_REG_CTRL1		0x00
+#define PCF2127_BIT_CTRL1_POR_OVRD		BIT(3)
 #define PCF2127_BIT_CTRL1_TSF1			BIT(4)
 /* Control register 2 */
 #define PCF2127_REG_CTRL2		0x01
@@ -616,18 +617,27 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	}
 
 	/*
-	 * Disable the Power-On Reset Override facility to start normal
-	 * operation. If the operation should fail, just move on. The RTC should
-	 * work fine, but functions like watchdog and alarm interrupts might
-	 * not work.
+	 * The "Power-On Reset Override" facility prevents the RTC to do a reset
+	 * after power on. For normal operation the PORO must be disabled.
 	 */
-	ret = regmap_clear_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
+	regmap_clear_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
 				PCF2127_BIT_CTRL1_POR_OVRD);
-	if (ret) {
+	/*
+	 * If the PORO can't be disabled, just move on. The RTC should
+	 * work fine, but functions like watchdog and alarm interrupts might
+	 * not work. There will be no interrupt generated on the interrupt pin.
+	 */
+	ret = regmap_test_bits(pcf2127->regmap, PCF2127_REG_CTRL1, PCF2127_BIT_CTRL1_POR_OVRD);
+	if (ret <= 0) {
 		dev_err(dev, "%s: can't disable PORO (ctrl1).\n", __func__);
 		dev_warn(dev, "Watchdog and alarm functions might not work properly\n");
 	}
 
+	/*
+	 * Set the OTP refresh bit unconditionally. If an OTP refresh was
+	 * already done the bit is already set and will not rerun the refresh
+	 * operation.
+	 */
 	ret = regmap_set_bits(pcf2127->regmap, PCF2127_REG_CLKOUT,
 			      PCF2127_BIT_CLKOUT_OTPR);
 	if (ret < 0) {
-- 
2.29.2

