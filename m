Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F26A655F2F
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Dec 2022 03:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbiLZCih (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 25 Dec 2022 21:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiLZCig (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 25 Dec 2022 21:38:36 -0500
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2076.outbound.protection.outlook.com [40.107.105.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A442663;
        Sun, 25 Dec 2022 18:38:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNITxNT6BtKqewEOCUaPlY8E4ZUcGpvFkBjSUVw0ctPUXwuV06Ddhudibqjg08EU7NtGPZPvYckXPEpK+h+WN0nZDVVtIYW1RXkUayl5wDp1Rs1oqB9GqLz3eklooA6JPAY6PHy7W9KPmDEEXK+blJJQJ/2D+H/A0xydOSouf3iwDmLLZXZjR/3PKNM2B88DOS0mX3r34vISp942iGfyEQooFuDVCH02+gRTMj89OcUGfciCcX5AARoMCbroZbbZPNyf03iztAcs5A7PlUCUtSGIl98JTzTcraenuc6P4XgnDH6RZ/0SPA8O01cU4UHq/CJxYlbhYDXWtTXc5K4hDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Y91eklegrrbGnVs6OmSekBd8942sU8+OIjdk5OBH/M=;
 b=AL3+2UqAvugKSKLRDvnFUtmWWIB5PoXuYGjBjk3nmf5Sv1BkZRVB2Bn5iqR3nHu1NkCnE2cl14NkHkZuNNgihfk4LFCLCOHfRZ1uHSo+LkOLA6++GOmU8naJWbJCrw3UEdzJcBh+b4o8OvLkDYZhWekC9aFgcTaMhwaCPRpIUAI7COMnR5Bvc9EOqKn8EZo0rxzjFcOqlg7xcBok5tR4ja07Cvm8CUF4ILAbUyBeRqEtwEqqXJvBJEnQESS8GQxwDGHK5iqHPDFqxWgMCSiieIwhCKXkHaiJUHJdpVQ/cbunLrAmkDxVMbBPFlD5IQOSoMVCwlK6JiD/qyPNSeENyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Y91eklegrrbGnVs6OmSekBd8942sU8+OIjdk5OBH/M=;
 b=YV5/MmKadO031E6UL8Bg/F56L/hy4zR0YZB/raSehhh0Wudat5IQiXG51Q+Rc61824huTiQjyBIg2v7QChlBcUM3yyGIwgjCqwYZuYUx1jB6bSMq33O90h5f22f3TeGTZx95hlmS7PLZ8bJHbXaYjVPJIQIULtzr8F4tdmH62FM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.14; Mon, 26 Dec
 2022 02:38:32 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::ebf:5645:b490:166c]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::ebf:5645:b490:166c%7]) with mapi id 15.20.5944.016; Mon, 26 Dec 2022
 02:38:32 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v2 0/4] Add nxp bbnsm module support
Date:   Mon, 26 Dec 2022 10:39:38 +0800
Message-Id: <20221226023942.1027270-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0147.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::27) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|DU0PR04MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: 3579889f-9d23-4ea4-c044-08dae6ea479f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: trdeiFIB0+FUptXAD6YHsvaxolqKWQUHGlm0yIfrQDJkVjGd6gk05gfal7Gq8tpBbLUxUjJXK9UyinGjsKAsDVcPmiPJH8tPrC28sRC3rMGl9nrlSm6/KrCFahiLewLbBDJjogwsJeqjIEc7/Q+HlbdrWXk5oOpG6dMth2OztVch7i+jm/65SXi0FObbJF0HsBZMb5kvUzkvGN2Z1p47D+9D5epqX6qnPHSoPvADKoW7YQcl7C2ry8mBHov3032vDsjhyh1EZQWbEbtBZ7XQW5WmRkhBq7hWumsx3qa9ieC1TS/cY1VB+n8XHNmp0qc1ZJ3+jcEWDCNez8mkjTL0TPcXZjrV5hICWh3acsK4VSoFQ9sa69bSuPVPdq+GqWB1GgNqrtpqjqISCDl1KLU0piqOwj4JsTIw5g4PeMW9actNFlQIT4coHc+ShF7X304cZpIF9q5s7oLexPJB4xqeyMkgb00Rtk5Ua1mDXyPwXCRFmCTe7CyzZZyGqKYqi98gDpC7s+XHjWx2A6ndYvdvl9Mijl8H1vcVNiLWN0VLoTv+bqCA/XtKaQCJcE2RJzQKUUQ2m0+Qx0nUOglqWhzy2lxlh8QO7PwNTyuCzurl8YPlWxixxFjQJWZ46r0fsAZxB4UYWNgCGx0g83gYUQ1EPHfB+NRUPv4V5bp61+1TkcjXReTeScvfP28/I4odFcTw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199015)(186003)(26005)(6512007)(7416002)(2906002)(5660300002)(86362001)(52116002)(6506007)(478600001)(6486002)(316002)(8936002)(36756003)(1076003)(41300700001)(38350700002)(38100700002)(66946007)(2616005)(66556008)(4326008)(66476007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ko45NSZ95n/gIvM8rZV2MxSkUE4RVTxLOnl6NTA3rqLccD55bX3BIVdlWlpK?=
 =?us-ascii?Q?KWUsuL9Br7yoOxJrl/Zn5RzUp9yby9iVc4b6C9Bh0JTf2LKk3/E1LndLTS45?=
 =?us-ascii?Q?kRZtiJZE90qChGqnKQrO+uHIWM9yxtt4lDIRwpboJZAsE2MrktkMK//y1kMK?=
 =?us-ascii?Q?zQoTqe2hjpI5eplBzToTcwZ2eUr3ByC6y/25DWNi1/ifUDbFmICnKu8Rkk+1?=
 =?us-ascii?Q?qhJ7YabAXcgd3dA4sJn5/N9VF1fjJPJSGPLecMlymgYXuNz6FplRPw0zXssv?=
 =?us-ascii?Q?qWwKhs40+Znegc5KOurWYKwI4IVvZj8ob9N/s/tqw60wruLJM91r6TTD5qxN?=
 =?us-ascii?Q?uI+SsmnINrIx7W+/iCmLIWCMEBffG2DYIPRqiwEDKwsKZFhmxA1JJUvO46g3?=
 =?us-ascii?Q?iMZW3TAlWGeuv/MhFNS9sJZgSgkPBia4kN/aO9/aIjBtE1U6QdIR6RaE/yxX?=
 =?us-ascii?Q?unLke76xipSKS5jslVaIr9BxI4Nm4NttnGw+DNCrYBciArqVAzJY0r+ddfYV?=
 =?us-ascii?Q?zlAgctz1Xm2zx5GbHx9adw0BeZHdqPBRw2w5qYEl/0cqrDdv51AaLWDlCARN?=
 =?us-ascii?Q?nkU9sC7le5QCsODITN7So6a1Z2WMnxx3tSAdsOpcinFDESd18Mz8H7N3bXd+?=
 =?us-ascii?Q?yZkKclMk7Fi9kGKwHA34pOrVZGccgOrsUxml6sRf/0hNVwDqRtgX1ZtYqO0G?=
 =?us-ascii?Q?6igOeeYoqCikqXLhYzZ7P7Bod44hjVIzDU/kcSesR/KaRIFkIxH8cjjlMJ2N?=
 =?us-ascii?Q?qu+Shi16w6MxMIdbKTm3TcBJ5BZwKaZsAv85cB0yxfBXTnsWJyuXCeBSeXWx?=
 =?us-ascii?Q?uQUPYRrVinpE3eGXDnrO3SIVkuzQ8c5D7srPmql9JWyeu8J++5dlWxo4qp/w?=
 =?us-ascii?Q?yLaNK/GiqVLlAz6es5RsBDJzGl0qdEQQG1bjb/RbJoNvzYkX44+SYlXqNP9d?=
 =?us-ascii?Q?r9zaKfI6VGWyM0FynyN/PsgHs59wz9Nw7OjSTcecOi8y5u45ZcEw7AaMhKcI?=
 =?us-ascii?Q?8+bXXwf2u16Ahv7s+pxcwRipj/4WsVDua8cS4goPa8IwS7QKeUjWZDk7ZNKG?=
 =?us-ascii?Q?a20GaNApgCGbxedb0TFNhoI9zGkUdGJ03KqTRIjeRtEL3todMKb5nycpYDj0?=
 =?us-ascii?Q?Bv+4DwtW6GKqEAh40vTT3XPM45HUEWhBmyXYhKMH0tljDHnhDzfsdvrpZ+hM?=
 =?us-ascii?Q?VHXhVMH+junGVQTv6/15U83kdfyNnPaHUDd5Kd0p+M7eIcEYoY3ErRi+dTOd?=
 =?us-ascii?Q?9Vh0KFd20bjR0MduaF86+G9qDLuJfTnHd2NFR3aCpmkWj5JpocsF3flNrLI+?=
 =?us-ascii?Q?vmWyau2wlYxfBQ7hrhAWLdRqTtgeDF+yljVNSViYyynZn7/JM4SS0xyum/ca?=
 =?us-ascii?Q?2srAEk3TT7ZxDpIMEDdAxOM8sBewekwkOvCxvE6H5AzEv1z10UVNA0U1KnpN?=
 =?us-ascii?Q?u3vf4UtC2otBry+udqfGmaIckXZCcGgn7tGov9r9DK/fRC0GzCRbZ2SBammH?=
 =?us-ascii?Q?miu5LLm13rlgW/JCS6nozLrQttPQtuwADJDMGS1itGcIMw2fi3DbdC4iGBgM?=
 =?us-ascii?Q?aZ7CUZaxnqCDgXJfQNetPtnX1PrQV3bVF3D38dsk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3579889f-9d23-4ea4-c044-08dae6ea479f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 02:38:32.7389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5BX834MD/4GMe6CZ3XiRicDeiJIqmzlVgRBfUyqiSXWFNPYCIVTt/T8A4v+CU/gYFIpYM9Ag1QAwvm6uoLq/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9444
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

 .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 113 +++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi      |  18 ++
 drivers/input/keyboard/Kconfig                |  11 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/nxp-bbnsm-pwrkey.c     | 190 +++++++++++++++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-nxp-bbnsm.c                   | 225 ++++++++++++++++++
 8 files changed, 571 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
 create mode 100644 drivers/input/keyboard/nxp-bbnsm-pwrkey.c
 create mode 100644 drivers/rtc/rtc-nxp-bbnsm.c

-- 
2.37.1

