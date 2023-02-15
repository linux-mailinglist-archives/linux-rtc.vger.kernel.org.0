Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 255E469746E
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Feb 2023 03:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbjBOCj6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Feb 2023 21:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjBOCj4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Feb 2023 21:39:56 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7491B2CC42;
        Tue, 14 Feb 2023 18:39:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mR0qoo8X3JqBmdj1xk14ktsRSATpQES/feHDWN3hFkafm4TpPMaBTOXnthRgeoF8NPyH8Bcsxk3vWVPf/9lpoJDcrVXupjvNUl7Z2wUXJiG+vtm/MAtvbdWrMbCMddQt2WkDLBlBpJm4Tz4TQHCo0us/GTHMEoB3mpKE1OiemqWq2kQ0kcIpBpJKad1nVhoRBBA8REbVKNcpdYdw6d6Cjyj62zQ2/W9UCQW+aVKLpz5dYWqhOPLGZU82fCvwz1TjJkcpdYxXyIpf43P0eg5D+QNAjeLHCBwLv0lMXYrA4M0/XiSMjWzno8zMGge+yJwfQcxLS2L51HTpBKFc4i9vEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyJKHLItjvaoADuueMadlKG6pYM4lFf3pOuhLvgzjJU=;
 b=IzXLVMlJn6q6Pr3ig7WrJvTH76GsNBtjnuQ1NJeBkJNU+TDaAo0DBg6b39+G4VmhSKkE+FKJtBk0mlVJl9EN+P5PFJItL6fB0z5oD4NvidfvAeAHyn0NacolZMBl/ulWW6mc6QbeBDutEwOv/ZoHHcCLnTFw3Bwy/Y+KdfjB6gXjTn5x3Ji59Cl3+jP0pa2i8SMHEafJ1vuni3w+F3bKOBDwx6PFXmy1+Uv2YiNkO0fdmuZXuXH/szBSjE7jtlBs5T4fcwzrt5oukFXfEJhDSvdSlfD45cRCB9GJ55tdzut4V5Ac2/0N/cCITABef4ve64O6N0haX3UiA+a3GprqkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyJKHLItjvaoADuueMadlKG6pYM4lFf3pOuhLvgzjJU=;
 b=qPZqgYyK/kxZY8Q+ggIwkFqT8KMDxqKvGwDB4NKZbH4HAfTMav3ozE0LFlFWNKamamtDTI+My58HSIM0oqLqbqtDNtyFTUsM39BJotcYIBFIJ/cMkTTSUea+Zvt3BQNAXkcOdw4R2Pp6m2I2ihXVlAxPIQ84sDkeIc0HVC5BSYs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PAXPR04MB8975.eurprd04.prod.outlook.com (2603:10a6:102:20e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 02:39:52 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db%9]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 02:39:52 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v5 0/3] Add nxp bbnsm module support
Date:   Wed, 15 Feb 2023 10:41:14 +0800
Message-Id: <20230215024117.3357341-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|PAXPR04MB8975:EE_
X-MS-Office365-Filtering-Correlation-Id: 3347cdd9-5104-40c4-754c-08db0efde9f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3JXYFuZtA2EwNpYY2BxCSirA2NqNmQhyoSwS72sHqlocIYMKbLtuu2C5FISnf8kEu1lpSZIHXzq5WRHBHvDJRUTENq0+6hU0oy26IcPwRbl3ugS0hNRgbh0OqKUmp4iqw3nJtTxUbfvy7TzAufY0pmbLK5OZyBe9098E+1dnjnI55jtjLahofWfBFmMI/4iTWU32fB5/iJtUVD6MJbJfh3fo6WqM/yss1nRjZ6oJqtyZaMHm9E8dR3gORGqk0/t2UyvW8ViZ/hJyohFj1wqDb2LFrE/uV6upvYZtRYZK3S/bSQQe4Im0QDRhn9SZzsuKRo7O0QObIz35dNmsPVTmfIHaOD7kCqn38T00aUVEurmJ5NwMU+qyxNhO4141pCOnxQr0C3FkUlaAuqBdHmqn8RB5icv55F+Xy0iCFOsb1e7zUuGQEVQnawZ+OTS1K05dvL6z8znz2rp+9AWuvvh2ydlG7JPj4IoV6FaOzqdBSOuLcbz+EcE1VWNBLKrsgrELXtJnXjh9MPDVuuhwyP1dlyODs6RAGUzRjC1umednOIE6EMGiwzaO4f2DEBywqeC08vJ8zkBUnySjHv+c6RqoYu/245aHr9vATMVi3/fyNKgQ9DaA9ybFDuwqtnU0OqmuFgKvzxuTf7yOxt23uaNddcihD9n2bFzBihsUa0jxuxQ+ppd86CyFy6yY1uA9yMghr5uOEiQ2Ktm7nBMWcsIyNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199018)(38100700002)(38350700002)(1076003)(6506007)(6666004)(36756003)(52116002)(316002)(7416002)(5660300002)(6486002)(478600001)(6512007)(26005)(186003)(2616005)(66556008)(66946007)(66476007)(8936002)(2906002)(8676002)(41300700001)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jFq9x6l7GeiSJn6y6c2H3rrkYm9fUSFALml2O7h5ylVtm/guDT7zkylaT/pI?=
 =?us-ascii?Q?qZk7GGkpHM3R1H3yO/S2ac6mcHIkbLGtIDBpnTHnxnGrstC4QmhThgIvVurB?=
 =?us-ascii?Q?A6d7xnVQUIVIwDXA0dKYhf9djNUB6yO+OAk26KmXyPBSWG/0O9+NejnsnciQ?=
 =?us-ascii?Q?kdEoj1VrNOQUgUInv1y+CbMQkA1OQk31wJwxUq2B7bWnhFwfxlMWJcdjTgXw?=
 =?us-ascii?Q?FgXrPfNbrbakmeBD83yS5PkhEXD2kP+ALPbY3Q2H02Qmn8FDcChPifJPja/N?=
 =?us-ascii?Q?VKfIwQ4+apnvuGmMHsmqIlm4/oenNLJLsK9Z3VyZXYGq7dDgDkTMhn/6od3z?=
 =?us-ascii?Q?HRLM8kKBEhz5zhuGPWCzulGOrbteiv9JR13CeNM5l0cU8aqZD7cy3yMQ2iBb?=
 =?us-ascii?Q?/AwqYNK3fApejNAxhFMR3WrthaqAmSOkA5OzWowOxFsSb9CJdzs70cPo8JYP?=
 =?us-ascii?Q?LJ7O2ztNnkeB0RsFPFeKse8vkKld01vyiZwHBIbhPrLvN4aY5LNYzOQ0OiLw?=
 =?us-ascii?Q?JD8aIx2uPxaUKDUvFjojr76Rt4Ek6fAdJDs/qYzWgZ6qPn/V+bt5D7Yipdzm?=
 =?us-ascii?Q?bbpBq3K6oYxGFE9qGCa8RRVq02Qd4vCsqMh7jifqKwZ5QgpoiVe126jsCQwT?=
 =?us-ascii?Q?TJYx9BcMnh4pa3rzWWJWfhVE09JTnKuUhfTMmDz5/f4kQ2Tw0hFOXq/PQvXN?=
 =?us-ascii?Q?LeSsqUQFMpoETqLpdvFIp8zaohDhpcafzxl2RTCdMxoE9aAvvlyr8JKjTS/5?=
 =?us-ascii?Q?92IjvZmkk/7N0NfSmQBQvPkaQO0LqI2wEJM9SgqhYj/KaAjt0UIhVTX6NK1T?=
 =?us-ascii?Q?DeXYNQi9iDSd0Dt/lhzmd/0o7fGEiCRrF+opVloDiBA5l31VKQTKuQBPpV8m?=
 =?us-ascii?Q?Cp8bJBmohehWdj9btLZiBMsARycf3eBdSQp6fPuKRLWYZKHQwDwraVpTt3KM?=
 =?us-ascii?Q?RCcKO7JJ1gU48MX3t/Jx5Dprs5IXn9OY5AFjl1Q4PJVR0eacYeW8saMWHb7g?=
 =?us-ascii?Q?wleIHYYHajBVPMUT+1KFmB7GDZw0pApi6oRfKvWZVuFX8SKuKMVg2Y6mlatE?=
 =?us-ascii?Q?JdjDcYrvE2ccf8XZyrAA/jlGRGSXtR2orySqQEf7VvGOANuq8RVbZdhj+/zg?=
 =?us-ascii?Q?p0qsKoZzxAy+RyU4APQ8sae4yyfwvJ6gm/VIUrwoHIZ6U9RVlmXzWeZ6TrTb?=
 =?us-ascii?Q?ZsTEmZTo8AMvdCJ/e3bHS2JlMSDl3LDRk1phq3tLjddMlNV99UoiFWAG1L85?=
 =?us-ascii?Q?2e40iJGDOjJt1BISExeGdP4nlm1RAcsy6aMoOc5GyBX2b4+18jeKzc6ouCjK?=
 =?us-ascii?Q?r3D9FRuTSyKcmd20o6rE5WBkOV8vfnQTT1Vm8yUWAUWxJdE7jR5UKn4fs+w+?=
 =?us-ascii?Q?PTRMHh+uJr7Eei3bPLq0W6tqiJ6+1BHIkpsOCG8wgB5BlXE6z1GigYHFrvPP?=
 =?us-ascii?Q?+2FDiFEjSMyu+nEYkuj7T1axrqPw5Zp/jhFsO09GEz1/WLHxF9uFB6gh6FkC?=
 =?us-ascii?Q?8m+Fk1un7w5DbuDSnlF5V6ye8AoMThyHouJ0PaOD3THr8oh19ys9ftuVDK1T?=
 =?us-ascii?Q?TlZU5TKmKQRVHS0hOEXlJgmlIE+4YwYi03hTmNxy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3347cdd9-5104-40c4-754c-08db0efde9f1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 02:39:52.0768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mr6JdsxJcYucjT06JG8bkRFKnkfM65wxyXm4fHxw4OOtagnPpKeXL+TPqc2b74ejatgydxuvcT8Ri8ApByiVNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8975
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

Jacky Bai (3):
  input: bbnsm_pwrkey: Add bbnsm power key support
  rtc: bbnsm: Add the bbnsm rtc support
  arm64: dts: imx93: Add the bbnsm dts node

 arch/arm64/boot/dts/freescale/imx93.dtsi |  16 ++
 drivers/input/misc/Kconfig               |  11 ++
 drivers/input/misc/Makefile              |   1 +
 drivers/input/misc/nxp-bbnsm-pwrkey.c    | 192 +++++++++++++++++++
 drivers/rtc/Kconfig                      |  12 ++
 drivers/rtc/Makefile                     |   1 +
 drivers/rtc/rtc-nxp-bbnsm.c              | 226 +++++++++++++++++++++++
 7 files changed, 459 insertions(+)
 create mode 100644 drivers/input/misc/nxp-bbnsm-pwrkey.c
 create mode 100644 drivers/rtc/rtc-nxp-bbnsm.c

-- 
2.34.1

