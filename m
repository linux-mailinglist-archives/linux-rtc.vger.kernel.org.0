Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C50C3E0CCC
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Aug 2021 05:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235225AbhHEDhE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Aug 2021 23:37:04 -0400
Received: from mail-eopbgr20088.outbound.protection.outlook.com ([40.107.2.88]:4102
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231893AbhHEDhE (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 4 Aug 2021 23:37:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrpZEKEdR8j3l7h5We9DP4evPoQ60e6kbqAXSdyPOMaSqqlORbaY/d6GpZmVL9wNWa0XD40Up29acO8NQ0MZeensn2iLbCJpDxrBH1Dax4UQBh76n7fsshbuV5CgV0tdDkQtOS3Wrop8wjZkYhF23ouC7U7rdblGu6xKBo6Wq1tMgW9YbNrE9LaarQFqJ4ldWdsbrtyWSA+3Ys0zzdiU50eN/OGTdWDFBLocxJFkx/DAsytMZIjN+pyyT3RGAmAD3VwikWsNeVRPRIF16hkoxTZNkDmKZ1PfMvk2nrOv+tOVhVvNPxE2Vl9+2eYjyKBSb3BwfnL8HHGIrN+RXZvlqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dK9ZMIR7SlQ9y5oMjwfMSD6Ox/yvu3e459K9SkrNgZo=;
 b=LsJp90473yxsAufU4hsAlTPHmVmd+eYC7s1VH1JFXe0eskmwBVFbOz37iIGWdNKokTckxDuunTicuJdmkBjCaXcT3RTFu29aPr6bWE7WEPVtqkMWF1DWOnQFP80l0zVFxm160kppVI/BcWQTcGUZwRwJWe5pls+hmBz/1zhOq02LLB/U/73uv4RbyOvkI3bHMUnANViuxOFzXtZ9Q3Cydz6uSFRFfDVF+3PdtWIJEAdSmYFch/Jt9p2dUzYVHNe0ZaC3yKCHMlUt6yonP8sqIaqm4rtdIoUx8VCyClyLb0yFH+UnBlcqNB31UIrFW0f4LpgqdFUzJdRwJF12xq1hEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dK9ZMIR7SlQ9y5oMjwfMSD6Ox/yvu3e459K9SkrNgZo=;
 b=iCU7oMkmpYR5ftnXqRj3ciRBXSw7VD36pIp11hXSduvcV/kf7jNB1iAStubxS9CzrjGldjeHtw284SSBvlYP9AjkwXaqAANi1UKJwyhXFrV5kDDtJS+RoY5K15xng5Uetu+VQIDblxBC2+FmL4oMTQFMUEEzwrVVXnlEeF+ZeV0=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8837.eurprd04.prod.outlook.com (2603:10a6:10:2e0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Thu, 5 Aug
 2021 03:36:38 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4394.016; Thu, 5 Aug 2021
 03:36:38 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, aisheng.dong@nxp.com, dongas86@gmail.com,
        robh+dt@kernel.org, shawnguo@kernel.org, peng.fan@nxp.com
Subject: [PATCH 0/2] rtc: add imx rpmsg rtc support
Date:   Thu,  5 Aug 2021 11:35:44 +0800
Message-Id: <20210805033546.1390950-1-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:54::23) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0059.apcprd02.prod.outlook.com (2603:1096:4:54::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 03:36:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00e4b489-7211-44e0-2e1e-08d957c23b68
X-MS-TrafficTypeDiagnostic: DU2PR04MB8837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8837B1641737D1EE9AB96FF380F29@DU2PR04MB8837.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lL2T5CgmdjwdB1qN0gg709mzQim4/XgCjx4JBjRwd+HC6n7hU+FJ1Ab6YYv9hZYYCyIu2/YTA8kfnfb5iCAlHAeTsGiVgl8ApA7vwkyCa5Va8nzoIuELABos+JEsFdv8WuEacwjq0kO2iYqroWgmqWIYnit9q70u+15bWyn+0Tco+GCSKv4KWzKsjN7/bw63F93TvMkgVPkTr/tqD3fEPmuUZLQW2AU/cXYc0x5MHdIhGMGM3h6W36X2GXMLu2daEGlOu96FDqbX8DYgNrIl9ydQGJDy3/ZrjVhXkliUluAhhAzwJvCpbYYIU5DpkZ4KJhesVI1WBn/P0MgHntlAdpTQmyAL01z/CIL/+FVhdF4NU/ct0nwnIa53IKR3Aq8J/vrEn+kdEU8eRaG355Gr9DC3bo5GmkE+M0AmgYRYLrWl8gfpJfDHCBnB9qm6y/VXzjAcAwKj3vD38hs7KH+OpEdd/8DPuCTZOzARK1G+zBgIn7wxOwLTsQVQCOZn/zso0AWM9OAzt553zPB6iSTj3FxvgmhFWMuT0Jf/wRXgN42md3fhV7r6KLnoqS74eNbzB6iF3ZxfyzEqpUgTlIsgyWSsGWGfMgv7OtGIoEiiSFWmiMo7H2+GB8zZzE1ZqymaA1uEI4dWErpXjWnGn9+C+NAniuGxelxeH/g/Cy7GfVKvOlyw/LM5jDjZvUJ52Toq96kk7lTlILaxEHoISko7gQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(36756003)(8936002)(6512007)(316002)(1076003)(86362001)(6486002)(52116002)(4744005)(2616005)(956004)(38350700002)(2906002)(38100700002)(6506007)(478600001)(26005)(5660300002)(66476007)(6666004)(66946007)(186003)(4326008)(8676002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PFwsgTF/XfhmqqyspBz8Jw+uuBvT8Q94GOl5rXXIV3nF61eSEjWW2SCRhfQU?=
 =?us-ascii?Q?aA8CJiC++JarrfHbJsVqVJivQG4/dD/Kjp4V5R/9nkaO+nMfS5AZ47u9/Y1e?=
 =?us-ascii?Q?nKnDdmHOPvC2FVKYQw6tUGMuHl+X51Fqdgm6/7YGHQu7v7QCtjZ3G4b6wVnc?=
 =?us-ascii?Q?C0APoNLu5HA8UYeuLiqjeNg9bdNl9KyUvs4X5SgLK9rKh3YHH2wy/rm5DHVh?=
 =?us-ascii?Q?R245DJno4omP48xOKC4ZPnH8KBTlqvdTHU6dHA+ys3xDqglFVrq9rc1yJIFC?=
 =?us-ascii?Q?/RFQV1oGOL32azJ0AKH0ZlzNaEE84w9z71eW7wyhWW0w6ImuWTP5L/JV7C+x?=
 =?us-ascii?Q?03K+MAojON5YQLAME9jmhW04SfVNMBkGrJmhfvnAAjgqqwoQcGLd5i7p/A/a?=
 =?us-ascii?Q?EWPRSs1NrL01bk8CLcNzdMlwHt9biqSmXMQTxvs81/sGm3TvigS/GNACcT7W?=
 =?us-ascii?Q?7U86y8YQBZFixEeEwWFCWgPRqmzIul/dalwwcS0jB+mNP/+TxJUbc1WDYaf4?=
 =?us-ascii?Q?WbwJJqyAZ4QUZLEk4rZoGOSO47/8BKApjvIUMmfbQWkO9jmSzV53a8v47QmN?=
 =?us-ascii?Q?AsrrlJcT4F8q8EeujVgCd9Khccql4a7MwdM0k9MDosDtHYq1wjY0y8xKlrDO?=
 =?us-ascii?Q?CM2NEs41rMLUkAU0ZXpGww/RjI5HEWq22aEnbe8qqPCc9AUwHr1u1sLOgRKy?=
 =?us-ascii?Q?K7uaI6cqlVUQOKaMbkn+lNzr5iV/59GwgOjCC5Z4SbcGqTyw35yr0bsUNt6b?=
 =?us-ascii?Q?dVg8v87IEyxYDPktEqsy+/xmmLMjYvx2p8tH0+4U43LM4Vt5qscHKDBd27D0?=
 =?us-ascii?Q?XwDlWKS5aJsqHvOJOM74u5O2yFyP5Sx5P5btgfNIqv8DTRt59YMRRRIw+BMP?=
 =?us-ascii?Q?sukayLiyHWQTqHxb2zOOQPr7vFGsXHhf+aG2DLMET/bA7bMd1QQIi4aKtNOB?=
 =?us-ascii?Q?O+dI1sNBtogdSKZ3E3vSZJVJqYSgDHdWE7VwlvKLZ5LUf9eK865tfczVap/b?=
 =?us-ascii?Q?YqNdhIvYKDcv7JIOIEYX0hijs3ebGL5ObUdCfBWu8imKxq6y2O+xT1zM5IUR?=
 =?us-ascii?Q?TBdLXIzFu3RZ6GVkN6iz2/zAJk2Y3Ca98mGjifC1PhO+l4I37BMGfE/Fu/LW?=
 =?us-ascii?Q?RItC8zm8eFCFahyY/+73dXrcZZX7zuGhx7bnG/R+CqP8x6fCJUGjNj1SR5Qs?=
 =?us-ascii?Q?C4P/R5zVmi/EosOP5JJIjMi+0ZvhadQ9zWDTUAc6h1qvXj5RuBLmW+2aLDdZ?=
 =?us-ascii?Q?+A6gw1+mNpi0n0AXCBO0pG0NJ6tthIYDq4JCxYUorDYU8VZjOvWBKRYt30qr?=
 =?us-ascii?Q?uv21Ge/kxeyLUAaMqfMXrYmJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e4b489-7211-44e0-2e1e-08d957c23b68
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 03:36:38.4329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7umDVu774oP5iSfugG3137OFDxXdoddo+AtFdN3vOc1vRrxNkAwaQb+YECnV16runK1+ybuFR/VYxyfxOpHorQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8837
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add imx rpmsg rtc driver support

The driver needs cowork with pm rpmsg on imx7ulp but no compilation
dependency.

Dong Aisheng (2):
  ARM: dts: imx7ulp: add cm4 support
  rtc: imx-rpmsg: Add i.MX RPMSG RTC support

 arch/arm/boot/dts/imx7ulp-evk-m4.dtsi |  48 ++++
 arch/arm/boot/dts/imx7ulp-evk.dts     |   1 +
 arch/arm/boot/dts/imx7ulp.dtsi        |   7 +
 drivers/rtc/Kconfig                   |  10 +
 drivers/rtc/Makefile                  |   1 +
 drivers/rtc/rtc-imx-rpmsg.c           | 301 ++++++++++++++++++++++++++
 include/linux/firmware/imx/rpmsg.h    |  37 ++++
 7 files changed, 405 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx7ulp-evk-m4.dtsi
 create mode 100644 drivers/rtc/rtc-imx-rpmsg.c
 create mode 100644 include/linux/firmware/imx/rpmsg.h

-- 
2.25.1

