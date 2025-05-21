Return-Path: <linux-rtc+bounces-4122-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E83ABEF15
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 11:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4EAF3A7D1C
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 09:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8FB238C0C;
	Wed, 21 May 2025 09:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="rc7xihXm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164B91514E4;
	Wed, 21 May 2025 09:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818377; cv=fail; b=LAAd2pmeiPcBvoDeT0lqwX2oXAJS1OudkFZIE5sqIMPKIhGffODU/ypL67WpVa3tQDcPylgBd6TR215glfmtjTshc44Z/6Hjhg01YUMPai+t8jgc7dtKFH6W4f0YDAz59c3gu+TQUGulLSv30SPRy6XoqluupyYMFUW7W6A9zqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818377; c=relaxed/simple;
	bh=ixDdFeZUJtY2XCa/1VcB0LBpGI/hipxQtGRbWYLHnUA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=nlQEVU7Lsb4RWzhlzCyumur1td/LdFw1XmtjcggUJ0w3nMu71LcHij1Ea3fHdYB74gXSiskeh0If1CXz1cDDX6VGSLZCRH8/5aih4+8O0rLnYSMHCJcIm65E/kWInEMGfwvDeAzDKbKAkV8zGUSaanKYV/HAQF2EbqdaeO79gJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=rc7xihXm; arc=fail smtp.client-ip=40.107.21.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubcsZ/M1s4Z3XIefx3SwAUxlVe6jb6ur2gITrH43mZbOB/eEAmE5sdup/7VwliZqmW6ViM5ynz5wxQhK0wh+fEffGqtrNWTQO1HHIZgxUQHm0NKV77IMK8h1IWPSk2BnjM1+yzgA0siyoX87YWr749EC1cZWtm5sR38yN7TisCZ0CSz1hGkPO9s8df07jJGTIcalHDGJf/9HBhD7JLmpa875ksMuIXcS9Nv4Z0ZzDIJAfqaqaqPYHXRBZiW1FWB34LyO4S6yldrabgzftT+mbsQk0h3fan/WzYiSOgFuHxtAvmMpFUkDond0kqf7Ee/lZrmNOROSFJW2wwMPxaJk2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gr3CXBV4fb7sV7CNSTPtlvpIQ8Jwlzp2jQdJ2JkkblQ=;
 b=lZbmGbLCaNwTv03aZOGwdk/f7B0KI2hpWai6ujUHCCVYHtHYosWfhZcb/SJ3VKuzu8NRKZb1vnTdJ5gK0z1HwbUb7Bwb9k+Z1mCs76A6+r7nuZ723vAwlWsCRSviiNz8nctJkTCY62PZHD0dVEc4osPzr0ptOpm76DsFJ9Y3MMghYAhnWKHADNY6FR1u9gkc7nw4oocbByeeOV511nwlstlnaR+baPZoscVGLGbY6nBCIsR6h0tNezw6mCtEtTTSCfsLEs3D6TPr0ue8ov/Z2srb7Mv/G3tTDnTGHI/TZMSZXf8nl1lRdOah5gcRqzKlFG3o3WmabkA5qEbeF4v9yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gr3CXBV4fb7sV7CNSTPtlvpIQ8Jwlzp2jQdJ2JkkblQ=;
 b=rc7xihXmsshoN5h+w2byqWcQ9YkD9QDzv/0wHeOVW20nUmoafkzteLLDSlRFx3yvz8jvuUzrbeulFgACUWjGjiTjzxFNSLyLgUxPQNU7hQeTK9akROxWnIzD8O0vjKdyenvTzUHMFSV3TGhU7jrpza1J56Le8KvMiBAmMW7snsLhF96JMeF0NLHLTdYm52+Sb1qyf74Xwi+L9MR8VpwUkVAI+xtDwmtrkhioA2srmFcL+00kwBzy5p1LhVYcfLBcdudutBCByD19Otj9SANbLFrArJOcW3FXxCEitx2DYsk1/+pjMVrLJFP2lSE0ak1wx3gZAAjzCIKmu529BQ6lYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AS8PR03MB8088.eurprd03.prod.outlook.com (2603:10a6:20b:443::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 09:06:11 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Wed, 21 May 2025
 09:06:11 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manuel Traut <manuel.traut@mt.com>,
	Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Markus Burri <markus.burri@bbv.ch>
Subject: [PATCH v4 0/7] rtc-rv8803: Implement timestamp trigger over event pins
Date: Wed, 21 May 2025 11:05:45 +0200
Message-Id: <20250521090552.3173-1-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0136.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::15) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AS8PR03MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: 59bab372-9985-4b96-10c6-08dd9846bb6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hd6QiEO7GlG87xeycz2j2lAr3bVa8vl6Tw7qIvpgfq7n4tef2/3ts5F39Wt+?=
 =?us-ascii?Q?TY2Dl7J73PAaSf/4TSH1njJcVAVZVaNFF/qLW8gjvqqQ5aYAv7g5bb6XRtUm?=
 =?us-ascii?Q?k055cVHwuus95F4LXuCPUDxkvNvplhXH0e0CXrehixI0/VKGSFFkbKGjovSj?=
 =?us-ascii?Q?H9qGVsXDcWmqq80/16sXic2Rrgp1vGiDxFR4qfn1BCoYpLCgC7RgfBoOdF87?=
 =?us-ascii?Q?XJ28jCkzHIz3rR3+fLIdIkBeif4Ytxt61+6y9kaIHP2ITtQkOPKKJZO3pbMX?=
 =?us-ascii?Q?FLI1qb0cB7zMXAd4anQXpdaWw1W8g10He7So3RRUlyebEj96MI4epu8H1aeQ?=
 =?us-ascii?Q?YK8DEmpBtkCkX2YLyY9dHEE45/ziJ2hokTT3A0ypsH0EyWKbydQVj+0knK+o?=
 =?us-ascii?Q?47MPxcXO9F5KBE8dMOX8NbiWJh2yKnEXPVgt88pWz8bfi7rxKjcjyG7tWgWW?=
 =?us-ascii?Q?LkQVbJe6msCsOawpia+q9ezv+tWI+NbnQCg+k3QZCzNJDlHTHdoOPcmD3Ewd?=
 =?us-ascii?Q?DSG1gbW24K8xQnMey8MWqUstOQoYbDhafzh5Wk2pTuqeFBzc4EAvmKxXmTO5?=
 =?us-ascii?Q?k9s8XWx074x77J8cUreze3oyIf+McLPlAmh2SAZKIs1F4WvpBmDxhLbe4O/B?=
 =?us-ascii?Q?XZm9sXlJoJ+TH5jCZWIIHWNdZPQStzFTqxsoylPveCdkbsfpRnqBeYwjpBx2?=
 =?us-ascii?Q?DebMhXm11eLkEY6h6+ILg4hp9k9pRYKKpAOM3QdjHsWOGkVFTgOIKSoY5pQA?=
 =?us-ascii?Q?8x1/aQcOsxrAv6k/aWEoAlFtjGXFWTbiOXfUoPDOpMSEKqsH+kZPXuF499Kd?=
 =?us-ascii?Q?x5tSdJRtFEdETxedTBPrFVoN7eEJhhCzHU8mYq+nOUt+ascK6+ktBk5jVAbm?=
 =?us-ascii?Q?1owecXTClx744J08SHVKPCNLEMOcASfhyYrI9iRtO+OAeCioeZUUFJmlbXsA?=
 =?us-ascii?Q?Jobk8QN+AJLolaKKLcr5GtBsjka9CPmVRgN/ZGu81oB15iHEDqHgBtrcQG14?=
 =?us-ascii?Q?ER2JsU/9n7C145oDlQeYWQ5XupLqgbPC2Y6RaNZYkQIO707WVyZa/c9RsnLO?=
 =?us-ascii?Q?/BSraVS+oV+EM1g9I/vpTtTDew441UmKAt/6+RJZtnBo5vT+M3yYVyEL5oxH?=
 =?us-ascii?Q?wOg34c1nrXm2ih2ElXhthIaN7+cCgKYf6O4jQQJ2jhr27rOFWGxf0wx5EM7i?=
 =?us-ascii?Q?b5uH8swbQmi858LdFnQ0yd8XsRAWuuLhcEKXNmFpdv4+DyBzZYjh/R28rVEU?=
 =?us-ascii?Q?jp7L5OcZArvZo6lLjUFtKT51JcotCjVCoA6PuXinQOzwCYUAqrVN5xsy8L9b?=
 =?us-ascii?Q?KXo98UjcGXXwVofwY56xFJnXGMOgl5YZdiQR3GtHTGtCVDYxl/7LOtFzo2g1?=
 =?us-ascii?Q?NpwVpGEFiSkEWYuA8RPgqC+FYKAwj9QU3K3fr8VZMWahUBAyPuIxFGpdgUl2?=
 =?us-ascii?Q?2Siritx2E/4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/n4W8SQ8nhUa1q0Nz/Ms2Sv5x+F7237+JDUCWzE3qs3ti/7W29qeH2p2XC48?=
 =?us-ascii?Q?AyOZzq8sim4VQM9vhso7wBt4Y1Pi0pXSv9/9qSWyerHH2M+fLfyM3gpfa6E9?=
 =?us-ascii?Q?gvNWluwGy3Zm35sydMjGCympnF2v/8/QtUOnW9KnPu97YZ4Mq1lcFK4wj2fN?=
 =?us-ascii?Q?dTJY7YqGXpwxQUUc14ORo5pV6DdUBqaaRPx2lYOkQuaTphoceL4iiBIKvVhf?=
 =?us-ascii?Q?t30Qz73MQu/0kBWDhXF7Fukgmx1PAhtGztmWPimwsRc90zRNe+T0pf9ibksN?=
 =?us-ascii?Q?LttwH9Kx2tcK96PRPLxUK3XM/R2yBtB9g5U1Fjn/O6RwYwgUQRo5Y/LTV+Oi?=
 =?us-ascii?Q?IzTqVpEPE0hcyoLv1DQwsVloksi/C0zT9/xDUb5/SqFq8+DTXf43mKVoUTJl?=
 =?us-ascii?Q?1ekTQbr8qOEBr9tvGq2uBYzWyXlzcYIvpXi2A0biqJTqwyZR0eEJ22mQ/xJX?=
 =?us-ascii?Q?aIEwita7efP+8tNqMeZs52Jr5+Exnl3SckcANUGq0qchGmCubLLBBA7USjSP?=
 =?us-ascii?Q?WTDWJpeyzD1nbOMi4a4jM3lnzNgv1MDY6zpVEe1yQ/eNDwWKr0nYfnboGCbK?=
 =?us-ascii?Q?rQtqKX2eHFpDpbm6WwgYmU01xCPguz12VPT9oPqo/0MW0RVmppgnXT9yMr6x?=
 =?us-ascii?Q?VTwDOsbVOeXv8aGqLA+DFQ2kpvDH47J2V2t4Ww+v6k82Ydl7WVEGBAnr4cI9?=
 =?us-ascii?Q?IZVUz5JoJCjy0pHJ4VYW8+wFf1LVwiaFbxb550N32SsnkOOYAovboo20N4/R?=
 =?us-ascii?Q?nK4r/yniHW8XVQ3FDvaGaR6Jd4cakoj8xdmZuI6ZI5a+pwjNIdtM/bC9Bdyk?=
 =?us-ascii?Q?0wVKPeq6QQCEF/5kKgYo3dd/82WE14FiHhcJTpesnZGLfmrosXIhqC0gIniu?=
 =?us-ascii?Q?bMpbiZnbWVHGVXqCnPeMv+uLsjGbR2PwgsdIBRHeTwUImeCL3U4p/FzPDWk2?=
 =?us-ascii?Q?l6hybjvJCb+xnVpjtMW1j744WRUFKfaZGcjqPpdE0tpF01cBnOa/wwRtAnTt?=
 =?us-ascii?Q?9p35UI1Hzo5dLTTzz2zCdTpD3Zh1IzNN2lObIAx2IuaCephg4ogRiHmmx75Z?=
 =?us-ascii?Q?7IuqTMmR3O5kegLbLzOvTk4NHwV0PD2Vha9KgqkGmjWLhjChv/wGYz1DvETf?=
 =?us-ascii?Q?SGb6CEgEgl55/FtF+4mjZ19GRuC+593xDEKN8mdecqLi/UTRlpwwJZ8Z3CP+?=
 =?us-ascii?Q?lCSyvUQVaxnvdZRzWpGjtT7kyXOpmA1yHFYQDFQUQJye1NvFlagX+UJSYUwy?=
 =?us-ascii?Q?fMRwtMvdN65yrou5eH7YdPtMO2UPV0aXQTyhc9EJaHJ+3CuDW/pFdGq9BBsB?=
 =?us-ascii?Q?ufDR5br5g+Rv3sv6avE1IWJ0dv8b6YQ4Ycy1UC+Tx1DTta8gVN/gODZbz1JD?=
 =?us-ascii?Q?cG/4bB58SonTCkI4ayXXxTXG/pzQ5tloCJKPrww4A4xOHIguWwhoKY14fKXg?=
 =?us-ascii?Q?pPrTvdmfsAT0BxWxnJXVeSyeFP90Se2mx5WR1i7mUkQWJ1aoT6yrCwqXjwya?=
 =?us-ascii?Q?VJnwjH/HZz2Zv1lB8FP23Sw8bI+TE8twX0oIzXpVqrGAC/9A8cEEhdF1gCsE?=
 =?us-ascii?Q?P2pVIl4+QMli2sWaXT9NkzXu8veD0vmfAj2hHegk?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bab372-9985-4b96-10c6-08dd9846bb6d
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:06:11.7747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQDrr8DpPkjMTCC48QWs6yweZiypJu/c5/gNAAySg3o8b+yDrP2PvrWU/BEBTAir8QHTcs+IgH8aWtRWbwgu1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8088

The RV8901 RTC chip provides a function to store timestamp events.
There are three input pins (EVIN1-3) available for triggering.
The timestamp can be read to detect tamper alerts, for example.

This patch series extends the sysfs interface to enable and read the 
timestamp events.

The data-sheet can be found here:
https://download.epsondevice.com/td/pdf/brief/RX8901CE_en.pdf


Changes in V4:
* fix warning in dt-binding
* reformat
* fix flags reset on read
* auto enable if configured in device-tree
* rebase to linux-6.15~rc1

Changes in V3:
* change permission for sysfs read to admin
* add device-tree bindings for event pin and buffer mode configuration

Changes in V2:
* remove separate patch for register definitions
* remove pin configuration over sysfs (use default settings)
* add sysfs documentation
* rework enable to simplify and remove big mutext scope
---
[V1] https://lore.kernel.org/lkml/20250110061401.358371-1-markus.burri@mt.com/
[V2] https://lore.kernel.org/lkml/20250116131532.471040-1-markus.burri@mt.com/
[V3] https://lore.kernel.org/lkml/20250513161922.4064-1-markus.burri@mt.com/

Markus Burri (7):
  dt-bindings: rtc: add new type for epson,rx8901
  rtc-rv8803: add new type for rv8901
  rtc-rv8803: add tamper function to sysfs for rv8901
  rtc-rv8803: extend sysfs to trigger internal ts-event
  rtc-rv8803: extend sysfs to read status
  dt-bindings: rtc-rv8803: add tamper detection property node
  rtc-rv8803: make tamper function configurable via dt

 .../ABI/testing/sysfs-class-rtc-tamper        |  36 +
 .../devicetree/bindings/rtc/epson,rx8900.yaml |  39 +-
 drivers/rtc/rtc-rv8803.c                      | 639 +++++++++++++++++-
 3 files changed, 709 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-rtc-tamper


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.39.5

