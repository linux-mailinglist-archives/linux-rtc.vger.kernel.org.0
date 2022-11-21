Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 455FD6319DD
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Nov 2022 07:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiKUGud (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Nov 2022 01:50:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiKUGuc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Nov 2022 01:50:32 -0500
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140083.outbound.protection.outlook.com [40.107.14.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCC713CD7;
        Sun, 20 Nov 2022 22:50:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTHbfLJXEOTEXKrq+lod1aa00Srx2Pc9bH+yf5oYv/rEq9w6cVmlyYa/IFzyj9oRiMDBHoM1zlqBpfF5XT5VTN0uVDVOz6bKcECNqcq03UziCuMOhoPepbFsDnmsJYv2JHn/Bm8i7b3Fay1kvEKEk6uXzbb9NtslxHyaIu2egDJECjGiR7busN0c7RHj99XBVr4TQ5YtoTzopT+Dh2c59pLI07Hf8owdaqEWefNK8yuHKqY5RJeT34vMU+xftoZEJ2E0zwHXuMYjiuEIm0/x1qOPTRH3WUyQSDPtSqyGS7/wXLkxhSW9KfxSc+7B4EFWoUqfGtqhlMoybdRqIAcvxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3z1ySkrBqQZVr6vY4is14M2zP9QqijDioFf8dn0K0/0=;
 b=Ez1rgef8QdSN69nLPPmnG4Xen1vnBCdNX5r7bdwnDw+GG2ZaT2dBhyPNPsq2fwfRBe8dV5VSeZ5vMROcn7Xy8390M0eKYZUqxnaQU9ZIYvKQh3vANta03/e87vL8NZnx+hGcXmb8TGCsK55rjnLoMLijw/6fvZvwxhGnPeCRY6chgu1BZDeDl+8GxT7XuOobMR9cLJDXPjIm4g0kJidRZG/ywkLDu4/HP8l3nmWB8cN5j97tZi+dlSncBXuBhGAHYatVmjusWeNPVexGuugXjvjhUH1md4rA5TvuaFFurTt6/bvEozrC9c0f3xwun35EFbNk51MGMAlH6ZdFkrRM8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3z1ySkrBqQZVr6vY4is14M2zP9QqijDioFf8dn0K0/0=;
 b=Q6eSllmgwMDjjIDhOiBwEszU4q2hMwd3z3xQV69SWllzjPd10hjuqCsQoTOJE6IucGfqKxd8NXShwLbWwzIMP+1lzbePtfAJrCYz+Be3BRj13Z6m5NIQ4Xe1PS/j6n06wvcPUi3E8/SgDTXLS2rB8qL/6cGrLIoYJqhVJrj/22U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 06:50:27 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a%8]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 06:50:27 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH 0/4] Add nxp bbnsm module support
Date:   Mon, 21 Nov 2022 14:51:40 +0800
Message-Id: <20221121065144.3667658-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0123.apcprd02.prod.outlook.com
 (2603:1096:4:188::22) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|AM7PR04MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: e94fd821-fd27-427a-16a9-08dacb8cabea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d2WtqyZkUo7Mvpdf1JTAj6oyGdIQEHmuUIP7u14zRZGzSjt9hoa2kaS9f8XjlLN7jYTHeNF0AwyaLE1r+jKi0bg+ycMm2n2gkWOJSIKbbmHijkX7G7a61t0fEEujEBvGfs06ye1UzIi3sDMx49bVbRDs4oaW+PXDpU4bhJsyISp7wpVSBTrRbDgmy5YzWX3ptDf4mVOz2rONyABQFw8LyyZXmK8JNvM3/WfOD5jxPaCIB6p9nQnjBXGUl2PzO16CYmjOSl1qQZyVqfzxjqOW8KYN+3MjCbCZgRxWDJ32oVfQrGOpzRXXspjFl4QrAaHNh5m+LZsFrNbGKnPOoN1MtgEcADc4FAQ/hgNO+lFFht8U8+VUsVo/2OGJzN2Jcd2ePQ+okuMlXOA26RikIstN8kXiI/jgElJj+rh0ddeVCCNte4R2phiTCTWOAqZbV8FzQiSSOmakKNk2hkOXT0QS4fCR0iZtBHEaYWlJv63OVEGpnKDZIYcLob/niJlqOxZyZLm40nFFcc/nSpM1Pfyb6XGbJqcl2Ta9gCCiugtfhae6BuekTz/33XZxFYWr+m4KmOYtI5JoOGO9m+EzmPA5nxdxBwal24AR5k6oA2BGVYVBJL57Dmp3QPEr5d2FlBJEP80U5q4PKJ3Qyf/op0KprspMeJ1Rbd6sjBEQZXdaxrOT2N5Mo+xPwm3Xg8Cee5LSZKu+p/b3wzfbvh0AoKzijg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199015)(36756003)(38100700002)(38350700002)(41300700001)(2906002)(86362001)(66476007)(8676002)(4326008)(66556008)(316002)(6486002)(66946007)(6512007)(26005)(186003)(1076003)(8936002)(5660300002)(7416002)(478600001)(6506007)(2616005)(52116002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HcmLAyKtNluxC7hsvdLMhJtDaX2pUgVSvAT8qupCzO+0g0cILjQCYKPBKsLr?=
 =?us-ascii?Q?Nb/lxEC7XwuMzvI7VbmRP3hGQuFF0tA1kSZXzJj0i43ShwEQxberGey1UXhv?=
 =?us-ascii?Q?LH/9clMILGLH1ZqUA/fcWgGNdb4nEciH5BGzwKs8BPm+n3WawzD5/QjdQ0wp?=
 =?us-ascii?Q?QJQYTUI25xSicbBF5OcEAYKB4f82pW1gtZD1802/LNzTk3WyCZFlEm0zA8qV?=
 =?us-ascii?Q?PVBor9Mc63Ifz31AWWhkgywkLtzbDqopYeaw0WW+D4IvptL+0arMWZDWwoz0?=
 =?us-ascii?Q?PrUizrNW75xte85BK/YTCeQMPDaWBWcNRfzP+NA4mkVrPmbKV4e2j5JF/5IA?=
 =?us-ascii?Q?S2Jodfh0BOMG2Pzqi4Cr1V7koUEgTxuhPSkb5CJ9lf7515863nCA3925Z9jd?=
 =?us-ascii?Q?Ss6+VHNvmM+FyV63LpifejjwScqMlx6Q2fGguRde1r7+eNvAoAHSDb0Sjgpu?=
 =?us-ascii?Q?BpeHSjBYM6hUsrzKngVU57olycz12csmL3Gaoqh9g9l/x7mlQr/k8hzU4Oql?=
 =?us-ascii?Q?1o2no7dkwLbeNYKMJFbCerRPe95VlfhyrBF0kwxYoaWFF6tqc+xFo+nYUfGm?=
 =?us-ascii?Q?nIDjIZZEUnxQmd9apcvjJak1As1/u8Lvr4Soylt+fdD05dnNykkewtH1TaVc?=
 =?us-ascii?Q?oct4G+fGVMWG8KWZ1j/gt7586OuHWU4uuCVnrqGYfmMtaMvZmSqqTmQ8Q5AN?=
 =?us-ascii?Q?WtS3degg2k7fjKZ5vo00CwPXaVHFaK3lSx521NKNOiYAA/ZkvXUmYpUt9Iw3?=
 =?us-ascii?Q?x/7Red0CkspLmiW1YUmwYPDNald4BXHl6FDgjewn+ftrcCI+8a7UUtbRNYdo?=
 =?us-ascii?Q?IAFcq1sBh2KTbq3PDt7Iurk+K2PxqUx2xk4rk+HgSUZl25wH4HT146gmizeJ?=
 =?us-ascii?Q?xodSQ7hmFuQnB8W+dbov/MD1K+/FBoer+ABat+MBoF+SmLGMlZoE5YptBKGa?=
 =?us-ascii?Q?TfmJQa8YjPj0WGojoQhhSTseGmz4ycjynfAmEriVTmDPYWiq0uzCfhGCxPpX?=
 =?us-ascii?Q?0X6S4Z8Mk/w6NIOHBzEKEHhDFRvq5CzvBxGErB0W92+OCJDkWzjwt1+0XIw1?=
 =?us-ascii?Q?MslTFlbecFIpLXkq4G6gzEbGVhgIhUo6gBBJX1py+BAAFFHMs+jjp7oJu5Bq?=
 =?us-ascii?Q?jylo5fymz1dbbx2dX2ChBlnAa7AtEbdGCMA6qJlboSw/4f6z8YMT1IlpCbGT?=
 =?us-ascii?Q?MC1EGwYsEhMi9lZ3yFfrP1cqImpnJhxzjIcUZ06d8l4dbHixciNBLAEM2PiY?=
 =?us-ascii?Q?fU460j2x7KKRDePANLJzE8olXlMTTR3/Yd0D0GjrrqShbVulo8ITWe1/YyKc?=
 =?us-ascii?Q?dkPxqeyM4INwAroI8+RaQ/x9IsasHgs54YgUCCfYCe601AQ+m3iCq6yOcs1y?=
 =?us-ascii?Q?+vZTOwSDTTBYrCxcEDOxihOqBk37C9VPAGFhFnS1dZM0GQJ6/2QfjWFfgfFl?=
 =?us-ascii?Q?XdkUJeka+fxn34vO+mgjhay1X3S6V50sItCu2XP7FZU9RbPd/IM6uZYpt1WM?=
 =?us-ascii?Q?MAfLB/hs8cBJqj9EgvXgBSJAp9phufUxyrHZF+BRIxpRXzUbeA095TQgddug?=
 =?us-ascii?Q?/LPoo4nFsDl6B/mWHwBH9b0x0hZxdZy6w6Ucqxvm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e94fd821-fd27-427a-16a9-08dacb8cabea
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 06:50:26.9888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0dHGVUOj2oFO05yS7ceaK3bjqYJkkB10Nh/q+v8pIgpd9vQelNmGYurjyoI3Ydi1i9hevO1z87svvpmlSlFfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142
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
  dt-bindings: mfd: nxp,bbnsm: Add binding for nxp bbnsm
  input: bbnsm_pwrkey: Add bbnsm power key support
  rtc: bbnsm: Add the bbnsm rtc support
  arm64: dts: imx93: Add the bbnsm dts node

 .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 103 ++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi      |  18 ++
 drivers/input/keyboard/Kconfig                |  11 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/bbnsm_pwrkey.c         | 196 +++++++++++++++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-bbnsm.c                       | 223 ++++++++++++++++++
 8 files changed, 565 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
 create mode 100644 drivers/input/keyboard/bbnsm_pwrkey.c
 create mode 100644 drivers/rtc/rtc-bbnsm.c

-- 
2.37.1

