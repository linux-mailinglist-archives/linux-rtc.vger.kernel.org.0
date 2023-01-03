Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40C3265BB5B
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Jan 2023 08:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232985AbjACHqa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 3 Jan 2023 02:46:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjACHq3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 3 Jan 2023 02:46:29 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2054.outbound.protection.outlook.com [40.107.15.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A705B1A1;
        Mon,  2 Jan 2023 23:46:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNZZg+C5JYHeKQs/wlUVCf7EkqJeedU/awzDauGc67VbFcj+tDoqCQckA6Pb/k7PlC3rKNPnVA+IW5tDwqe4ZcDPalqjYYLma3TkEHqBaTII2dNknu/kRsiBuC33uYyKKVAh3KIQgolZiJcUI+4Jv+rbgsZpDSgDaDUhEJqfSKFYChTTFy3tNyQCMlab4tAmeyH3gcJnktT/j6XEYzMJ/TbGVPurU0843AlTD+9NVQlHgR4p9t2V74W/A5JAGYWKjOG7iFNHI4/VfJgG57vRdhEbqCYWzMiDV4sNPPX+T0FTpvzlpBXPAcFh/e0EQJMIH7ErKXnzUwDhgg0PcGAEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqX7ppI4glqGb8kIhBvVOjWU8QjBLH+7AYFh68ikzaw=;
 b=V24CaIkUw7kjlnV/DVnL9PTaVRt8DLjj87YfGsFhPK8y4xompsx9Q3fzpQmKhyZeuZjkLlEUML9bBdMNBckdTBxNCCtv+rMqboKDi+c0d393YqK8tur7Amh47KMf8MJgjiTEdjE8jD2vdMAX3ZJefsewDRL7wbCRfsPyf3KVzfBlPQmoh8/vRFgAN+9ToqyfScMAyc4dIOukFkuoFFV+gdmeXeujS/Dp+aGVt2Wgg65UnDGSpjD6L1zMJKU/PU4nqSpJqHoF+EW6+mk9HMhx9dsj/y1TTzdG1Whh+Yv8YC3/yC3xBKmbiH2Te/dN/iQnck1szGRaP95KPSZeiYoupQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqX7ppI4glqGb8kIhBvVOjWU8QjBLH+7AYFh68ikzaw=;
 b=SMQYexMLYPum4qSHfydppa3ax5Qg2JZtPCA4fi/WReKUuOlYX9tszaBCvBdPdne9M5+6wPvKvVY9sqrxiy+AYQH6afSkMsOQxp+qT+8hZWaRS11QKHzN/r+ZeHaGdbLO4myOZP2OLrgWSGaO5Gi9h37w55NRif3CWl4ChwlKYXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18)
 by VI1PR04MB6894.eurprd04.prod.outlook.com (2603:10a6:803:13a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 07:46:26 +0000
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::286e:e16f:828f:f4ce]) by AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::286e:e16f:828f:f4ce%8]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 07:46:26 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v3 0/4] Add nxp bbnsm module support
Date:   Tue,  3 Jan 2023 15:47:38 +0800
Message-Id: <20230103074742.2324924-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:3:17::32) To AM9PR04MB8650.eurprd04.prod.outlook.com
 (2603:10a6:20b:43d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8650:EE_|VI1PR04MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: 66013594-44b4-4185-5b76-08daed5e9dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cf6Nn+pPqUoXbUZ0c8b9IyIzDr/rVfJol4MifuCCyoTaDcP+UWLrO0B+ji4aQuk++r5spztr8qaLcIKANmz95X8Cpwlek4wYGYzLyGeVUA18lKxHZExRy/r0CZQlOibDzQu9INDQlE4/9Ix5z2QfthaeK1QwZkZ5SpVZehHzqioJcLX4B7TuHOPeFyMg64rJQvV/2cAd7LhVMdF2OwcQwBibBF62C+IjaDZoy0GNiiAVHANDtRztk0F4+Xtmh9xpSuRm9RIO5Tpsqo5q85j/tICrBGEAFyDwNglgYDUK4D0KLhAF/hjeNq6Ii84iC0pYwMriKouw1pL4Z2ndZ4eAN1qDghWLNJCZCTk0zanryZdo88/FXYIXsznsxSnzA3EW4aRNwcGIP0CjzYoodCYGCeTQ95tHLZpbSvRI8mDZk1Z5LomBGqF+F5UlPNG/BVVF03i8kJhM0YuIXsei/a3EsaFzUthm43aKm4K/v6caY1HI8vUv09ZtkLeSG76UZwiJMQj45KikvzHsMp2xgczncSOnstKqIq7GWsJxZGWE9TMNhi9XeYGHnKgKimz5XphtjRNnXAL1sgGdku6i2zUbq68ndzRnRAMuizQmjuGN9iDRzNb6hy7Vfmckusky4fxsNFM+sCdrLNbamRBN6q1jvXDv94LWUkJS9wgBY+bsKHz31KfigRkn0jJuMxoR0rOmcz/4r47Z90SQ9PibQh59qOQdqaYpAjCvcFfMjTyH818=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199015)(8936002)(41300700001)(6666004)(2906002)(8676002)(38100700002)(66946007)(1076003)(38350700002)(7416002)(66476007)(5660300002)(66556008)(4326008)(186003)(478600001)(6512007)(26005)(2616005)(316002)(6486002)(52116002)(36756003)(6506007)(86362001)(22166006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yz9gL4JzHnQfmtqHsYdFmujGbH5GTeWa1yEfVpY6R1gSDzLjKgO3bSnewNHx?=
 =?us-ascii?Q?MbyMFAr/Gb8Hnf9ItggcrZX7Qh4nVYUxO5Byx7U6aCDMIY4bcwveiyRVnF/g?=
 =?us-ascii?Q?ZpM1ZWcnl0l6fZEv7xXOY567Ngh0uwttWbVe1ZV95IF5CXqdopJcAN7BVRv8?=
 =?us-ascii?Q?uoxh83x4OoZjZybBz6f4gN6QLj2UG7hkVTvebGgHIBhq7DYOZ2/jF/Xypk3Y?=
 =?us-ascii?Q?4+8n2XQHi66DazGak51Cjj9/oCLNzKhYuz59HsaJpXym0y4xKMsCPrU80sVw?=
 =?us-ascii?Q?Om/FJd5Wvjgo59Gez44Q5/HF5D0dElBovHMFxY9RDQU3Ks61Zbbnd2pmTPgv?=
 =?us-ascii?Q?bohlfnkkbc8bZAcVwIy/wig4zd+4Mv6z0XVuUgU3bUhpGEFGRNe4nk3d++U/?=
 =?us-ascii?Q?csQ4tYriHfLD5yO9J0d02lNPHTZ0yk8ll7NMCjE1rk0M6ddhcaxlN0ykWI3A?=
 =?us-ascii?Q?34IwBaVS7KIC+vgV06eBRdHGlLzgl2/Oa04rlhgJC1x21k+iERyP/wzVBOZJ?=
 =?us-ascii?Q?VgpjZwjQwFJ5qfYdrF2aHCzR3iBrFe6g81oAl0ZieuKcdrDDOmwcXyFrNN23?=
 =?us-ascii?Q?1YXE1uoB+aiyXKY0vC9w9LLI3xKJvOw/hBbkFK9GmwHJmtV10vXnJIlP6g4G?=
 =?us-ascii?Q?Loy1Cw6OvwMxoKFC9faiEpOvQ6/qdnbUh5r8twJlt9KquIbc/KjU6gZ9LGb5?=
 =?us-ascii?Q?5nTGCTNIa0X8Nxhpp29P+bu3IyGa6HZY/fVIcrjgAkODccvvdBg93bcGE8IS?=
 =?us-ascii?Q?Y0q3Ml1b36oG5tn/dyQ5KyE3lG14nmGqHE8qEIgU1WGUxxkEfeBETcifgn61?=
 =?us-ascii?Q?yjBkwiikGV2T1Bq+vwItLioWb1LUVBooHyPfI+/TA2ew7qU+Py6lb9ihjzKY?=
 =?us-ascii?Q?xk9RGFVoiE9EgpPyNNuHMqkr8kLJYpfN2hZkOrapAnvFdJwDpGSzPY6RhrJ2?=
 =?us-ascii?Q?uIO7AmuklPG1ca9V2EeYD5PXardXvuDu6UcQHT9WniTEjDghVNaFKTVRc/Vf?=
 =?us-ascii?Q?yU2SpqRFTNolpg8DC8JUr79fcdCT2Yu9hckCo8HgF4oCntg0p/nffPWT2mUo?=
 =?us-ascii?Q?vSc8ZzV0NVNtUUgFieO7nyo+JX/Sje5ia7f0JRDTDigEFLK/+mpHBmVbjmsB?=
 =?us-ascii?Q?uK8tdaDx7dD1Hfnqy3bK0B/s4uiVWQuPdloqR3DZlNSCAtuOwqzIkEiBGkWO?=
 =?us-ascii?Q?5jWdBIKrNmc/qy2IPATcEgbHdPgE37RkjB0YfRxxSPyl/4glPsvDVO5HpA5q?=
 =?us-ascii?Q?l49E4qo8Oy39v62kRblkBTmsj+wbsa3zv6iDVjYfemhSDpwMfNYx4Ctih3TZ?=
 =?us-ascii?Q?9nPa+iYXQWyZru5AVygPhChXPbIAWTSvxVFk3YYlc3b9dkRO43yQAt1JpIXl?=
 =?us-ascii?Q?ECvj6qaqbW2GG9jeNJs+tdM5wUlKLZqjISGtbKnpeIIPU5wK9U5i22SCvlRx?=
 =?us-ascii?Q?yCQuiI/JeYrVZByqtAkRRD3Qe8pKKMPLo846EmKHEeW7ljeFVh9hK4gz4SzN?=
 =?us-ascii?Q?KYhWrUYS479X4sIxeUslWrhUEfLHnLCGavN1I+Z3UtjciwcDFu/jc6rMUlSL?=
 =?us-ascii?Q?jprUSwTkE9kAv87Yqkij6RJKNLxme1P894z/e9uF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66013594-44b4-4185-5b76-08daed5e9dcc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 07:46:25.9907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyvFvmT5GzItPj2J76K3MQooCTOqs9MEYWQO9jOvvj4XgIAeDupnmE/5LytBdOuc8bRf8GZU9vk6e2vrDhI+ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6894
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

NXP BBNSM (Battery-Backed Non-Secure Module) serves as non-volatile
logic and storage for the system. it provides some similar functions
like RTC and ON/OFF support as previous SNVS module found on legacy
i.MX SoCs. The BBNSM is replacement of previous SNVS module, and more
likely it will be used on all the future i.MX SoC or other SoCs from
NXP.

This patchset add the basic support for BBNSM that found on i.MX93.

Jacky Bai (4):
  dt-bindings: mfd: Add nxp bbnsm
  input: bbnsm_pwrkey: Add bbnsm power key support
  rtc: bbnsm: Add the bbnsm rtc support
  arm64: dts: imx93: Add the bbnsm dts node

 .../devicetree/bindings/mfd/nxp,bbnsm.yaml    |  99 ++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi      |  16 ++
 drivers/input/keyboard/Kconfig                |  11 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/nxp-bbnsm-pwrkey.c     | 190 +++++++++++++++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-nxp-bbnsm.c                   | 226 ++++++++++++++++++
 8 files changed, 556 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
 create mode 100644 drivers/input/keyboard/nxp-bbnsm-pwrkey.c
 create mode 100644 drivers/rtc/rtc-nxp-bbnsm.c

-- 
2.37.1

