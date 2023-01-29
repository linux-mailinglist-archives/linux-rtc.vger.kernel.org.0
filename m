Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E74E367FD3E
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Jan 2023 08:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbjA2HHQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 29 Jan 2023 02:07:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjA2HHP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 29 Jan 2023 02:07:15 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2068.outbound.protection.outlook.com [40.107.6.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD2A222F8;
        Sat, 28 Jan 2023 23:07:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmcJ+GDbIO4UjVNpx2ldDkQPp+GXtY5FKJG860mm2wt/wu/Z1Fkeute9v2QbqujXgCCmuqLwabGft3X3pr8ucjLuMSA5BBy1Lc+dUtTdfV8iY+f9CJYHGTG+XD6LTTtSMJPxrCRkBCtlKjN2sjTJ7vurzfxgeG/kU5fUI+s1k97L9cedX1LC5YmJ3SoBACNk6WutoWkFuJLUuOJAPQKytTpWCRdwjFb8A16Vo1U9buXTsPyRDLwk+Ge38pyYy3f+80VvGTeXvaeQH66/smW1O4sJ3nGzJ2tBThhtXZB6aIkVd/I4p2sZtTZfgpfm1gBmmh/iB4qOOb3N+F3EDfejng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PROqGALXwT39hAAoeVpLPOiXehkU60gkSUsxuRid5GA=;
 b=axCYwx4gO3MXbC+D6H6VNe7PVRVMgMXzVJ2y0a8zxVJHCbLl9uMrNUOgX4Y8cond3aSbmb9IXP+jv+Gqcz4vvdnGjVtRuxSVIhhiDBQnwdIkgPSgF4GmuagNkX1nBoxzHPtm24Y7mIFLft9XJjXTMz5M3brtHoFhdldXLgl8AbEyL8ahsENipUhtVMP09LlKRHthD2f5o6e/WHg3+zxtheVLDvVh9W+1P2tXITxnOCDYITjVcNqNLQQV3wrhsiEvF6Blg6AnvGm/Gx69y9f+kly8bf1/drbs8gPOYBnR3oroTXLat0EtvlmygThWqAFJT/TzH9VVFLJGR7ko++hVhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PROqGALXwT39hAAoeVpLPOiXehkU60gkSUsxuRid5GA=;
 b=syCS9m1xBTM61qEqfoOUHoHhdCzh3lB5Zf0zf65Pp8G8xI1QLSPE0hwm64YlR7Z19WiOG1Vx7+0sSleBBrqbgacUuzmoGd2nNhlKhWJ32lGq+ik7Q8a47L7xs8RypRTIxbPzQKdBvah+XgwYR+pzhiWMuv2QY1qdBwLovmnb9tA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18)
 by PAXPR04MB8815.eurprd04.prod.outlook.com (2603:10a6:102:20e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Sun, 29 Jan
 2023 07:07:10 +0000
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::4ca4:bfde:62dc:4b2c]) by AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::4ca4:bfde:62dc:4b2c%3]) with mapi id 15.20.6043.033; Sun, 29 Jan 2023
 07:07:10 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v4 0/4] Add nxp bbnsm module support
Date:   Sun, 29 Jan 2023 15:08:19 +0800
Message-Id: <20230129070823.1945489-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0170.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::26) To AM9PR04MB8650.eurprd04.prod.outlook.com
 (2603:10a6:20b:43d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8650:EE_|PAXPR04MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4f0257-705c-4f9d-51dd-08db01c7706a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JKzQ9SvAyQ/+F46qLVncQhWldNOrtRsgLpYaxGLYX/wSeKA3ZKxQkR705WdEaf0uqep3TcwifqdH1dM8r9D43YKlo7ij0IOKNVeztWXh1n9IU9GGqN5zGTG6B8PnGQ/dNWZ/y9liWZ0X3qEWTggHgD55D9H0yyApTJcsVth6dNFcw1g3pOYW4vKndc6hy2ZwPHNN2GaVdZnFc1I/01WX9CWVn2JuF4bHrZCTHAtJM3KVeuZKtb2rB2HXEiWP1qR5pyA4GDBHVHQzPMLoh1frByJQRMeLrH9s7uspFVbYK5brN5pU2k4PhJXt0meFDkqktxkSOJosbYsEBCh4IXelQgVw7UwyQsQu2sutfIhSGmx5hvLy3dxieO0mKcjiuhxcn9l9YpzKb259BdicVy4PdgCWJkKK4tUZldjzzFxYwHohOtOyzIrOz4mkRQ5I6koOJvMrkrt6BhJKx0IwIItX8HjN7MYkBjHQXLkWcAhXDplcbqLFzOEoT3phEB+ddN+ZG7vmJQybaETvGvqJ7U0hK9N0hIOg0xtLWsnouUc3MkRmju+t+6fwAe9xFVi5WDO9l3C1ZY8NxJMiqGsM24HVWPEKkOLPTgid7MwRMIhruqTHiLUBT1S+czYg8TWfPKKu4Dx4AX+jgF7VpCRf6RXgaQTJG/j4vGf7fvy93GNH8uNu/85zxI2/rqQUWbG0VaYEOBAgAS1iWA50KKoVfNNxVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199018)(2906002)(36756003)(52116002)(7416002)(478600001)(6486002)(38350700002)(86362001)(38100700002)(41300700001)(2616005)(1076003)(6506007)(66476007)(8676002)(66556008)(4326008)(66946007)(316002)(8936002)(5660300002)(26005)(186003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IOig2pw7GOATpULAybhybU1S/EHviXWtI9XruG8HEGDn8NGYPAtLxx/X8NJ7?=
 =?us-ascii?Q?VFu6iW4Y56VWcxuhWAoxliLeblB6zlF0mk4GKH/1fJAps7aui4MmhIInC825?=
 =?us-ascii?Q?fZ5GPFXZESU8RiBwfpSv2Df562wRrdIqsn9aTTSL9tngDJhT4IzEdN2tyjIj?=
 =?us-ascii?Q?/gMAaPspq31nbOYeUEsZG2lqlD3j1tJO12NmaFoUfynxanbwv3fdb6RsI0jN?=
 =?us-ascii?Q?TIVkfKzp73TtC1jKE5ntZ0p2ivJdB1AXFk7uBu88iJXCpeMkwQlCgyZwOwPS?=
 =?us-ascii?Q?qeeDIGGiHQ8QC5TDbS6jF0aFDcQmpGcqNEoUEm2clNaTalSXzjLUK0sU+kYH?=
 =?us-ascii?Q?ND7BycIAqeU40JOfot3wHcK1z8T2eLpFbFWnrOGB5K8IeY6YVpxaDI13B7fI?=
 =?us-ascii?Q?AC/aKGpnKEFOezhfhsAFihotatmh30qz2iqxKtkBGI3sjLMAm1s37JTyH7Tz?=
 =?us-ascii?Q?XpZOxA8sHb8YDleOuZ1psidshAHX0k0UCxsdeWM6/456w5OOjzcSi6/spjaG?=
 =?us-ascii?Q?WaAQa2u+AqZVrkfxXj0UqYBZwbByR2RJgLvtPZy2unJReLpAxydW8XymQ5bF?=
 =?us-ascii?Q?SFB7earPxpu1jftukLe1mmwS7wf4dRjegEj3uUpDDn5lvfj53Jjf2FpFZZpo?=
 =?us-ascii?Q?us+FSrp5sNNv+TNQMlRwsK1MrjNkH7XikTZ5puGNBqVNLFDkWf/3hj3u9yVz?=
 =?us-ascii?Q?nMMxzjjg5V2waAlNRU4kLNaGrzN5pgUmRTH8L14TwV4UmHQE6xRscgP0c6kj?=
 =?us-ascii?Q?99qTGOO3b6OfZCkmQ50VwAPy0ZW/GjvCP0068Pb9xzkOblrlnscwmT8q1YyF?=
 =?us-ascii?Q?vOWLoOcfI+2CmueebPGznlrwqV+R68yVXcKnd0tjr3pmY32XBODKdR2RmDFe?=
 =?us-ascii?Q?LTgq6G007nvr4P8bF7dxJjXbC+tQcq1Jo+w75WJSIq63nCLoUuH5rue/y+P0?=
 =?us-ascii?Q?PNjSSd3heK8R3ONS2uzixeEbhnx57zl2Hg4s2YyjS8HuQfm59mrz4Xi2Y+OY?=
 =?us-ascii?Q?VwLTOYS1oJZGprDGIf3rZBNICddB13apUWrXKeECCwo5G7Vu8UsFbojK49sY?=
 =?us-ascii?Q?D+0863o1fIUobxQ418QqB8Pz5B8gKUQR79lNng5tryQBqEMjHzrMHGE88mYr?=
 =?us-ascii?Q?tKn7vuUVZ9bj+vaT8ad0ezTGFresa3V+s8dXNmuTwXP56/o0rDBkq/pRyzcU?=
 =?us-ascii?Q?aID3h9fueW3zSMfW4DtTOu0Fbg7bkyfv1t6OSBsRm1wnFUNKucj7s1VZDYFn?=
 =?us-ascii?Q?XAr8Jk8WfQ0GnOZ4+0Mr1rUO5dz2DT70GKyyRn71Rh5S//JvaNFy0DD2v9S0?=
 =?us-ascii?Q?clmmLZSAE9vs+j8VPYG03CIvBhiFsI8ZbeQAxV1VXJojdWCUQDvkf4/1ErR9?=
 =?us-ascii?Q?cJ0XcizqGWGoDo+gw6Kdi0tW6PDeEhoIYw2bOPYAmUUrWVWn4uiIA5o4rN1h?=
 =?us-ascii?Q?YAVPaXS1hpb6pupjdfcgZbZQIUiTNoLcgF2Nih46wkmS6yi3n2g7QltsLlXL?=
 =?us-ascii?Q?rUoYo61GAyH18YRx97JtMNOQQKXKjKS/14KsEval854zn0ihmi1hGVT2Rlo2?=
 =?us-ascii?Q?sSNLNcMbI2CWdE+RZS5BcZE89i8G+seWN52pbIib?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4f0257-705c-4f9d-51dd-08db01c7706a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 07:07:10.2799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HwtPx53gc1W49lzjG5ZthEBLUnSDwCSKe//oSWP0rDrN2W30MY2tT3/ud/+5IR9wzD9du/b0yJy0d8HkjDYRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8815
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

 .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 101 ++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi      |  16 ++
 drivers/input/keyboard/Kconfig                |  11 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/nxp-bbnsm-pwrkey.c     | 192 +++++++++++++++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-nxp-bbnsm.c                   | 226 ++++++++++++++++++
 8 files changed, 560 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
 create mode 100644 drivers/input/keyboard/nxp-bbnsm-pwrkey.c
 create mode 100644 drivers/rtc/rtc-nxp-bbnsm.c

-- 
2.37.1

