Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE4086F6798
	for <lists+linux-rtc@lfdr.de>; Thu,  4 May 2023 10:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjEDIfU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 4 May 2023 04:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbjEDIe6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 4 May 2023 04:34:58 -0400
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2090.outbound.protection.outlook.com [40.107.247.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485145273
        for <linux-rtc@vger.kernel.org>; Thu,  4 May 2023 01:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/g1IlKVEFTm1l4Iz6GSLsK1ONCWKWNNO1HegiBc5nZbGl9yhXKQH6fLJN7VEUDL9N9x9XAp8yNDEtXlkgHllCOuV5BQaE8sr8Z/tWJINXY2eLS2k4bSqRWAdPmDpUQrLsTEqF7/lDWcGr3a1j9ox06Gs4d/D83ZwhWP1oh8j6klRhif8GImPUyxYD3h5z+Ul7sAA1gZ+/bQSUz7KJBRfm8gFWq41MRLokNljAEPFGscF8YIaqLcHZkS15/xxjAxHqgHYzbKkv5Zk0OEdmCu06pFoYsPcjLES0QgG6Q0YJpAbmHuy7nLBLaH3qPWWL+y1MFVJWjIKE6CrBTvPDdJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsTz5x/hsRBHD4r3aTCJ6HJIqRip6HFvR/hTtWQ3WOE=;
 b=ZwS85nSPINMF0eQPIpczAhiMp62bAxk1NUTicBm2XO/xpAOVXIM2YjdbJps338E/BliJ32coLIquPsE05UGsa/H5wWDG2Is9BYg0aXzX8JsapCGjdKQbs/DIvksqB6KOjNi/iiRn8hlNq7t8aE5uowPP8YaTikdOhME0QrZ7aP9BZXOBdNtfAMbaSHjjDpMTW959IwQ0QKxhRGszGgq8F4Tb/c6XjNgI6vTL4BAV5Fzp7HrQifHUlQIg2C9Xl2b2waTzG+qXCqZV3lFo6uIbLuEIN1Lo5xw/UE54mJUDpnxtaXoGbWJTlcWyFPerLJt3EFbPapj/DN/eBW9v1Na3qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sigmatek.at; dmarc=pass action=none header.from=sigmatek.at;
 dkim=pass header.d=sigmatek.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigmatek.at;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsTz5x/hsRBHD4r3aTCJ6HJIqRip6HFvR/hTtWQ3WOE=;
 b=QmflRt3EWAgqJ6gZNQNO3EeuuGKdRBo9d/nPoYsgHhT22Jf4mNQyD3h/9m2jqZVZwNhv1PMTkZLxnHHXis1q94oYhSCt2+9zXknwGmjrgPzA11VAIQZLMYtZAEw6jm9j7bvzZq/7DDTb2HQ6JuaE1Em6RdtE43plLGgXa2yhX3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sigmatek.at;
Received: from VE1PR08MB4909.eurprd08.prod.outlook.com (2603:10a6:802:a8::22)
 by AS4PR08MB8242.eurprd08.prod.outlook.com (2603:10a6:20b:51e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 08:32:38 +0000
Received: from VE1PR08MB4909.eurprd08.prod.outlook.com
 ([fe80::89fb:34bc:72e9:6c15]) by VE1PR08MB4909.eurprd08.prod.outlook.com
 ([fe80::89fb:34bc:72e9:6c15%5]) with mapi id 15.20.6363.021; Thu, 4 May 2023
 08:32:38 +0000
From:   Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
To:     linux-rtc@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com,
        Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
Subject: [PATCH] disable clkout for rv3028 by default
Date:   Thu,  4 May 2023 10:32:17 +0200
Message-Id: <20230504083217.2371933-1-johannes.kirchmair@sigmatek.at>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0802CA0008.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::18) To VE1PR08MB4909.eurprd08.prod.outlook.com
 (2603:10a6:802:a8::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4909:EE_|AS4PR08MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b587886-ab6f-46fb-934a-08db4c7a1e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O/LAjI0lFYKFixwFV172Cqj0YV5YmD+FcqsWoGb1/Z2Zjk0jeBErPJJXu6HFKPldegCmZGndD+kI0h/g+ynmMelZMUVi9FDHJaSlG9HTxifRO5Lvolbghd/Gj5NyDplg5TEmQr6tnmqLmi5PlKYhAHqHYcpwBtMutUUXzkLmX7FzlPKgO8PTTeHQaMVcVrW6oUF9inCmT0XC+YUFQwGsKY4oMiWqWGwEblZECqNLg+URiZqcilCS2GsRvo6csYTEwI/JZ+T9oDml0tRQsPA5mszAuIlOnZfY6QTHq/PlMzbWYul9WxJkDC5uC9sqHvdRKBLBxBfBlD2v0kHtBzRxc7HA3HlztvSfKWc0A6dTBW0fq226S4aJ+2pyUDhuNc44DdAY7LhnSYyvQtWY+3HsvCjxA/gP9g5IC9Yc/1nM1GXKA95L2+z8iLYcrnjU1WOlPqJk5GU2YgbkVlxqZh08iJs847M0zNaC/kQ4jLLRouZm0+iAGmvcX+VZht1WtBQOWCzx63Fnd9YlaeD65kKQy4Luj5sutuoRe+GzbGNN/DqQ2NqWZPoT8yhDX8pbSXg7UJHGdXZlHV72+UBHzc4GP0kIgBKr2kkvuWAw3RmNsRCvQna1vvoZswqh+A9JU++1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4909.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39850400004)(366004)(451199021)(44832011)(478600001)(38100700002)(38350700002)(5660300002)(8676002)(8936002)(2616005)(26005)(6666004)(86362001)(66476007)(66946007)(66556008)(4326008)(107886003)(6916009)(83380400001)(6486002)(6506007)(1076003)(52116002)(36756003)(316002)(186003)(2906002)(41300700001)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qNME2BVZXjc/BabVIi+Lzim7MR3e/lvUY8EZ7O/fLrnZBlvO8bdm8LW+PCQn?=
 =?us-ascii?Q?T3TvP4bAhe8IKO4VoMfgm2/F5BAgrdqVHXNuX14TLLDRgmxEBcGR+N5IRDm3?=
 =?us-ascii?Q?gE+WOmvPXGVWu0dS9JjffAVE9rZMfhF6YJ2J6WCT+anXTIwyvBQ0C+6eN0ac?=
 =?us-ascii?Q?Ih09nxdwpdsaBl01bam5Tn1ZJ6lYbaxkP0x7mY0m8+8+QXp4cU0Igjj57+TD?=
 =?us-ascii?Q?ewd0sZAzzONVv3vDJ3TwWikcexfH8Qy1J+En+PZL27yp5snHsrOkEplyGbKg?=
 =?us-ascii?Q?u3b8OmyDhJZXwc/tAPRku8Y2rCChS/hJqNDKtZiTleZ6rKkuNCXtkrr6ZWGM?=
 =?us-ascii?Q?yAvk3WMB0TYMWECvZ6HaAhEim2DGM1By+9whdNxBTPWtNe5aj693Wx263KIC?=
 =?us-ascii?Q?XANp3QuHojwANXFmhYYJ5cbYliWR9659Nk1TcBjENzqLeSAcnIeIpsOf0HDL?=
 =?us-ascii?Q?63gbuBMQLQmYcW8xoCYvPGt7NcpjULUD48ByBNToFJD0X6bcRVBYQI5A/ubX?=
 =?us-ascii?Q?/cSx3GSqlhPbK8rvInc1URjs+NY9C3LBzN4bRHPus+L5liRt0i4+mnGp1ubp?=
 =?us-ascii?Q?flQmkQ/H9Fp+aKSvaFWbGIZXEYGTPwBd38Trh2ibelCNdYBvDQd5T6NEuis0?=
 =?us-ascii?Q?+2uzJZKbIOPwbnDw7LthVY63Bb1Kf7zAudT1VYdK7lGv4jGO5uPTe3/KQYaj?=
 =?us-ascii?Q?pXjKA5POm+AywYOXJRwKoEKH1Xl2uWeECsJiS+ee1j8nx7VkdDApXSchp5Ok?=
 =?us-ascii?Q?VKBJ9yPYFBoxwoKL0kOF8vhCcHZe/hiwiuU9aN0pJnbqCd1wnWb+lQkmK29k?=
 =?us-ascii?Q?JKFcAoIZxIju/vrkvy7j2KDkSru6LrGMYv4lFas6j8nPSyUEMnyun1J+EtJi?=
 =?us-ascii?Q?zU+g89NNsNr8dlBDfUn2rDlh7c/T7dI4aOtL2U+u/UVTl34ESetr5Ga8wMag?=
 =?us-ascii?Q?SfpptLmYFCgIGVoorsdDrXAXgdg3OB78maeYdS82yQ8T2/uYgngfNPhuH2nj?=
 =?us-ascii?Q?V2BCMAW6ZlYmxSqIPrzlTti7ylfMfvon0OdusM38zMu0297FISulCCY7jvsQ?=
 =?us-ascii?Q?1LK1dycpVGzFNuvNJ6vKY4Y5Hbh+4NPWC+JY2QNnIB2U7bPbfj3Q9Y5cswLO?=
 =?us-ascii?Q?z6UeC2P9Y6BtuVyB8jnIVCivmbLCDXgc/llH3tbFWCRMpxZQim3Hf7iddSp9?=
 =?us-ascii?Q?m9RToY5lhJcwDObo6iJbCuSdJen5LAf4+ggO1fCjj/sDheXISlgwHCxzF8oM?=
 =?us-ascii?Q?ljg6CStXu84niA7umSKKNSRNFNlWuajePST/lvz0B4tvN8GcBTUw5avPdNGU?=
 =?us-ascii?Q?STX+WPeiBf5qnJe2AUKZpzW7nKAe3xAeprjE3mZhnO/PkJ/jVqGOHE0jgI+5?=
 =?us-ascii?Q?VEx8oDM1ui5Oy6fkw6xNgspiU/FKbYmUvwKNUjov/ayfwiTuPYMSKjr++kpA?=
 =?us-ascii?Q?hfs9NqsUpKDYr+DHL8x1/V6em6Twbmi+6LLGz87olE4KY7TTse+J7FtNf/J0?=
 =?us-ascii?Q?WOibiF26CUEVW2Goxdm30dGafuClv4AsrwFfOWd01PWV7x9iiV6CPTjlge5i?=
 =?us-ascii?Q?m1GxDwNsHnINExoukDTtxOwIYEW+MNKPRvik8qz4YkGyYTUitdfoQsNx11jJ?=
 =?us-ascii?Q?FaLpbAgmI7e5yfU4zKdhxes=3D?=
X-OriginatorOrg: sigmatek.at
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b587886-ab6f-46fb-934a-08db4c7a1e5e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4909.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 08:32:38.3637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bcb1d87a-d2bc-486e-a62b-9ac9c746bc1b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKywdja/Zct2gwg52MY17NXWn+kne3/h7C43tMWoU70IazDPNinw7fEW8rM/tVMOztuDqkw47iFs6IKPYxtYn3te5aYXxQ4ojjy06tnXT6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8242
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The rv3028 chip is kind of strange.
The chip has two inputs one for the buffer battery
(V_backup) and one for the main power supply (V_dd).
By default a clk out of the chip is enabled, drawing a big amount of
current, draining the buffer battery of our board in 3 days.
There is a mode that would shut down the clk out if powered from
V_backup, but that would have to be configured as well. In our
application the battery is connected via V_dd. So disabling the clk by
default is the way to go for us.

Signed-off-by: Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
---
 drivers/rtc/rtc-rv3028.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 12c807306893..9e2aaa7a533e 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -787,7 +787,7 @@ static const struct regmap_config regmap_config = {
 static int rv3028_probe(struct i2c_client *client)
 {
 	struct rv3028_data *rv3028;
-	int ret, status;
+	int ret, status, buf;
 	u32 ohms;
 	struct nvmem_config nvmem_cfg = {
 		.name = "rv3028_nvram",
@@ -826,6 +826,16 @@ static int rv3028_probe(struct i2c_client *client)
 	if (status & RV3028_STATUS_AF)
 		dev_warn(&client->dev, "An alarm may have been missed.\n");
 
+	ret = regmap_read(rv3028->regmap, RV3028_CLKOUT, &buf);
+	if (ret < 0)
+		return ret;
+
+	if (buf != RV3028_CLKOUT_FD_MASK) {
+		ret = rv3028_update_cfg(rv3028, RV3028_CLKOUT, 0xff, RV3028_CLKOUT_FD_MASK); // disable clk out
+		if (ret < 0)
+			return ret;
+	}
+
 	rv3028->rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(rv3028->rtc))
 		return PTR_ERR(rv3028->rtc);
-- 
2.25.1

