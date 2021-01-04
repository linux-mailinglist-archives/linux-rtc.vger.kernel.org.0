Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F572E9AEA
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Jan 2021 17:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbhADQUs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 4 Jan 2021 11:20:48 -0500
Received: from mail-eopbgr10076.outbound.protection.outlook.com ([40.107.1.76]:5354
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726098AbhADQUs (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 4 Jan 2021 11:20:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ke8KP/HJvxCJtDxvP0T3po501J5xiQd9vQC92UJeyxPQn7KgijcXSnP1cS40LQLct23Y0I89zW8+NtDsh3Blzc82h2OHh/lSwqrYViFDvwZGYgc36YnbALR7iDn9J6AjyyHfL90+vrx93Ib0vQ6KcfDCo7HFbKpVSGhyX7aX1BLWEBp/1aaUdGAGWaVxYsxs87u2iJ1I2KLgWM6ZAYhSSXZzX9jFJEFHU6b3zELJZuLBHo5fewRFC6CxynR2sWQr0FjzfaYfnnrWan84pIB2+QI+XiK2SrYT7BZB2fEMjOXm7gwZLVdU5ZcM5yKzDF3PnOr36gzirvfkjMMzKiV5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJjsg7BoxHRMSSJz6jyZ39Sf9JrzuTDQ7gUflQ/73fU=;
 b=LAP2ARZ/M9TPDwkG5CihTQKkuin0lGLm60423o1w7nZ0FYmKPVLRwSTevXyLhmXajhfXDcUhXI+C/uwtSwqu7OYz3YOv8dSr4z4j6yFUvpfYJz9l4ee/0YN23Q/8KFPydW2kxClI18CmPubOJBP40Y/HoVWhxGK+H+RB47BeJ+S/0kECmhvjTsOWwgcjZNgjX+uj4kJByi65n1tcwdd8BqoNk03D6EsDIRtIa1z6gwEXqXuv13XBmdqEht5xBvdC1LoxABGeourkGyLafy0D85J12nciI6Z7/KA3+MUyKjGhB0+GCbKsV/WcSl6ErQq4Y155MeORZGRB/HcAtiYY3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJjsg7BoxHRMSSJz6jyZ39Sf9JrzuTDQ7gUflQ/73fU=;
 b=sSDR+9RaClJhEIR5NO0eZbpbhkJaFyKlWoAPjrasKctl5WvJAuUxxocMQQD28+qPeHBmIyOMtHn9Uq7tSfr2aYPJsaNwEO22j4EEIjVqRLi/M7BXJAoM8awxFxopvlgIu6axVcmzi/qsqlmTgHev9KDpciv0w3E7lajSH3AyHGc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM0P193MB0531.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:16d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Mon, 4 Jan
 2021 16:19:59 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 16:19:59 +0000
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
To:     linux-rtc@vger.kernel.org
Cc:     p.rosenberger@kunbus.com, dan.carpenter@oracle.com,
        u.kleine-koenig@pengutronix.de, biwen.li@nxp.com, lvb@xiphos.com,
        bruno.thomsen@gmail.com, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] rtc: pcf2127: proper initilize rtc after power loss
Date:   Mon,  4 Jan 2021 17:19:08 +0100
Message-Id: <20210104161910.9144-1-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [87.130.101.138]
X-ClientProxiedBy: AM4PR0101CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::46) To AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fd::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kun-nb-112.kunbus.com (87.130.101.138) by AM4PR0101CA0078.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend Transport; Mon, 4 Jan 2021 16:19:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90226db4-2d76-4b63-d014-08d8b0cc952e
X-MS-TrafficTypeDiagnostic: AM0P193MB0531:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0P193MB053181671DBF8E2ABB98DCDC9FD20@AM0P193MB0531.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2xpu4hPpUncB5Fm6bgM0kRlYsN4xivWv2M6giVg34bkGdXztbLIrFjjiV9zF67Ljtm2MJ10Z1O/j8oz+CzSKX8gYzx81d15lOQNZGuhQR+Ji8666CeomTrCefL7T/gAXTQPByqR+0zCUlY0Y0Goae8o2HNl/kGNMSXY56iMto9RrEB8zMb1lbNOdTNDGyWgZ96y7uE1S3jbj3dUbtPeIiUVctrYDNbXqP+f/VVNEB3zG28LiuJJrwb5vMUahDtgn0tZCO9o0GmMdoPKqru/+4285E6E1ly1lkOgY6xU/SQmk7O/1EohhMu+1mP0gOeYC8vA9C1xNGTixd7/2KP3HXeU6JNJ/dg8gCzsUzD/H7zIgBUCCTPAQ0sCJsRGUVZidvjHySEJCn2csKLey777ECg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39830400003)(136003)(376002)(346002)(4744005)(8936002)(66476007)(66556008)(316002)(478600001)(36756003)(66946007)(6486002)(52116002)(7696005)(2616005)(26005)(956004)(8676002)(1076003)(54906003)(186003)(16526019)(2906002)(4326008)(86362001)(5660300002)(6666004)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?btuq2bvx/fYcjnY9vknlSBu0a2bkkX3GUm6NZtTLm5Rple1Z9IihsVByOwET?=
 =?us-ascii?Q?P0rJfRGXvcYXlZO5aeqjoBREqmlWSrdZPA2CjtiIaAzXNnZr8iLAXemJ+as+?=
 =?us-ascii?Q?PEca9DXdaa7G5ydPwb31cCGZTL6S/HNgQ4zw+wgmVIT/BsxJ0c7wyR0eXw/I?=
 =?us-ascii?Q?ZPMVZTxcA5bmedAJQpFunC6okFvPX98xiyg9kkqWoHJi+32mgrTaVNpXMGZK?=
 =?us-ascii?Q?+vT9y/yBh2LhgUc93TrL5jvFDUXpA1Jz3s4zNcDkGnZ8Hi5bWFk4751lbUr5?=
 =?us-ascii?Q?ke8qOSaEPUZOffA/1IiqFWBV8AcSAAowDVNAr51zTakBVeNzAB4sQf0MQ8Vn?=
 =?us-ascii?Q?pVgl7p0VXiJM1E8UOE/MjvGoEEwJEbeBzsmfhifLtzu1hT3743OT0HgvbTOQ?=
 =?us-ascii?Q?a3meEidfwWqP46oaZp4mC10DQH91JxXlF4v+XnnvqVehhPALEDa5YavnTo9+?=
 =?us-ascii?Q?mk7r0P9vfE9dEEo0NgrOZDB6IrM5MY5D+uegSqx0HS29VQh/IXz/i10NTa1z?=
 =?us-ascii?Q?wuVQETSl0rjRU1rqwOYVvqJP5+huGg+VFlzf0b4Ms11sLHNGm3G7e+9Tiou2?=
 =?us-ascii?Q?whl1HPG9yhYis1+WJ2OE9fvjhEja9CVAoOtDtWIAJEqv7TOOWC/sLVuUyIrO?=
 =?us-ascii?Q?uF3rGJq8bjbCEZnGJcd11+A7OCV7UYU6xwG8tRpZMHbTGpzdRg10GkRDtZOP?=
 =?us-ascii?Q?Vua8vioHJ3iYmwSxlGXZ4Fhzv5V3JZXS4jqsY0H/gxavQoVjCSHZf9Ysef2z?=
 =?us-ascii?Q?opog7PvQNRSFLo8FAwvohl9l1ZYckqyUS8KX3PjXq37r3eGi5j8oEpnwZkoX?=
 =?us-ascii?Q?C9H7bYK1St+LNZoXK0OwPBtrxTMEj2NnP5Csk+GL2MgpycZRprwndgO22uiG?=
 =?us-ascii?Q?Aw/udhs4GSIAylmkPW3SAz+J5XDWHeMIvthk6z9FfGa/4Gg3chlPAW8hAFyQ?=
 =?us-ascii?Q?F64W75CNRaRmKO+0Hc1Wv3NLgqdOdCTJAxWOdbdbZ+d0SQ5iIzH3On/hT0Hi?=
 =?us-ascii?Q?+klO?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 16:19:59.4460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-Network-Message-Id: 90226db4-2d76-4b63-d014-08d8b0cc952e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMGj/ZaxMSArpl2b94AlZsc/p1KBTAzBovDEG9Kmc4OjJUJAcd/KLdqhJpzuXXZsWbGerbm+Zg8eqxI6efWB7obl0ShxH2CON44xoQVzZgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P193MB0531
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

If the PCF2127/2129 loses power it needs some initialization to work
correctly. A bootloader/firmware might do this. If not we should do this
in the driver.

Philipp Rosenberger (2):
  rtc: pcf2127: Disable Power-On Reset Override
  rtc: pcf2127: Run a OTP refresh if not done before

 drivers/rtc/rtc-pcf2127.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

-- 
2.29.2

