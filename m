Return-Path: <linux-rtc+bounces-2266-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 318C19A9BF1
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2024 10:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 501671C235DF
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2024 08:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629C014B08C;
	Tue, 22 Oct 2024 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="lruTj7Gz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2126.outbound.protection.outlook.com [40.107.22.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAC0148318;
	Tue, 22 Oct 2024 08:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729584226; cv=fail; b=TGYGMA41/8t6LiQf4GltShSHyY/mHGUVztosvaz02J2yyMryu1UGh6PMftYerarwDG/hV8B7TlaHo6DkZj/a3btDcW+/oDUnWGYQoBi5moaxqEveRr2GApCHL+k5GJv9w7209sMSuAJOZ3KhZ/fRckyaMhEUdYtxtnEe5mQy/X0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729584226; c=relaxed/simple;
	bh=gXKJabyENq819BPo9RWC7depqsIEoP70+lnCb+SPeGI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=M25cSMSMxUSa4Yy+fkBnd3Eb/tS2eckxvDog7/2kltnuS8PCgbp9WfQDVWpbyDMrsN+rG47gV9cRN+W88CGwXps6NQ6haFcPP4PVGDnHc+WKKJHGXHnDr8rr5Wyw6weOMKNoJnkqePE6xpcioMGIhX/JvGVIRnF6IBjSEWjK2W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=lruTj7Gz; arc=fail smtp.client-ip=40.107.22.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/HY3zrJYsE+IhT5lkbObniDDVZqI3amZXsOqUfhlgsjdrOVroDVP+2S2NhmyJ4pW5y6BaDqMuz6fr9926SwJPDcE29gsGX/lDzc6ervCdkZZXagWGw3/keV24MmP+Z8u69vl5+/ej6YLxB3Vrm8iteTCZXE8/6ZwoYnIDWzM+dNZrKQfCktebt3llNPUoC9+hpPbRyc9QraOFXNR3XgsBMXRIQpKIdIfImY7jy7gdEBVslDSpe1wO4oCKfLZpStf/Me0cLLss5GyEzM23Qsqk0EXncRzI+rBatoOjq3QXdbbIxasCE3G5oakG3t9IiNCrwt9TWmpI82TziXwiqoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xncoUvyz7r0mPGslSI5NsoReAFjBOKLe7cWniozGl8E=;
 b=a/G5xBMLvBygYlriIF3AlM9XbM6k8XcaF7XcdO5vnmelAqggO0qxtABiNZgpaiIoyeJE4Mq/ZwAg86E1Gd8HT7U6E3pB6nkDzHbPdSDExFquZPKlmzXuGaK6l77RJvyXTO3RYAEAdcsdWdQ7n6GNUZJgGEZQCcvaNIyXBe0+BCJaYIhMxTL7JmjL9/zYy79V8nsw9/YL3J4GuHF9A1PAqlKqMaYyY1fppc2mPyMi7lKLpURQsQqg8jAf8VicU9lLFSZtIzIZ6bcD/+V+9fdyOhn8uB4filXzuhHI28o6NH4YxnJqW+LwHWGBK49fd3rRWIGtEbDO6BbryiTNYvtgsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xncoUvyz7r0mPGslSI5NsoReAFjBOKLe7cWniozGl8E=;
 b=lruTj7GzFPo+0B/0jbLFst4PrELY4ilajxxuOES9rkON5e1r9CmULQMsfco2lW2i7UuJHXwFUh01EsgRFggJj9oStne35d0sDl8Pt7fqFkjJrgtUhGayCgZPCuTZg2O7FwmXZabA8tun/EZanlyKBJHJLJiyki8M5Z+3in9EokE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:160::8)
 by AM0P193MB0497.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:16e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 08:01:58 +0000
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90]) by AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90%3]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 08:01:58 +0000
From: Philipp Rosenberger <p.rosenberger@kunbus.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Philipp Rosenberger <p.rosenberger@kunbus.com>
Subject: [PATCH 0/2] rtc: pcf2127: make battery switch-over configurable
Date: Tue, 22 Oct 2024 10:01:19 +0200
Message-Id: <20241022080121.1594744-1-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::10) To AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:160::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0P193MB0738:EE_|AM0P193MB0497:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7e1603-039c-4aec-8e2a-08dcf26fcd82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ke9pkOYjDfbtCbstjy2QncNoMCe2qHRdkxSHWXEUBxfZFUAMkBf2eXKAbMQ6?=
 =?us-ascii?Q?KJYgFZDcEdSW6fESi3Mxq5ZaG5krxG+9QUHJAv/qNUgjBpQ7rtL61eaqvf+2?=
 =?us-ascii?Q?ucoyUZDyEnwg7HdrUfN2oti2N7wNIx+r8fSOBWpFKloF4UmD0w4R7HLSFR/P?=
 =?us-ascii?Q?KmgRcMgDirKOY3yGn7n9/4++MjwZijXz+9mT5uOtuRySpeIvlOPEVPtHyufn?=
 =?us-ascii?Q?IB8WECUYddMjiUJryyuUpLvcBapr5Qqb3T/lcDrYpUsYDsYNKrWF8VJx8/d9?=
 =?us-ascii?Q?23QA5LAkhGranDWD6lKILsys8Ha1Mq5kgD8ypKCQneN/WxENe4O1w8wJbS2L?=
 =?us-ascii?Q?7eSU/W1rK3zcUgWMByIPaQLOz8pi4EDVKUNU/Gvd7iePkhB5jswsFvZuCHMM?=
 =?us-ascii?Q?xIKpBXfbTG+bLrzyIN9sXdeV6UwkVM04IpUvvw5FHberXCwWsTDEqyHpa2Vk?=
 =?us-ascii?Q?FfuByAixiOk3nCero7FeMsP6AqBSZ0IbCM+vSgoGIO9roE8OnP6WAnWreNqV?=
 =?us-ascii?Q?jih6PReu/0X77kxiPnf2lEVrXPjszt56GboHbMCWenz3CXQQyiHvT4IAL6wA?=
 =?us-ascii?Q?Sz8cytJq6j+2sjfDYr8nF7IUkjChTdrP/5EV4LZ220jEOO6ZQm1egcPredgb?=
 =?us-ascii?Q?33zotiCBHR9LfGVApsH0Lr5K57CypwlTIs2vRwapnKrs4UmOXWFyErUn+Bfw?=
 =?us-ascii?Q?W3EXVCuZrk1O78wGca62aTVYWhTtnX4XrnbaOJzzLo3/vzVYbguHSqz6DIHK?=
 =?us-ascii?Q?ek76o3Tklf4JmMm9rKXnJCuYFLQorXfAyyIDBBC/1qgMV3QHZIrZSRyBfYjQ?=
 =?us-ascii?Q?Y+Tb6VFot00w+2HLYbN6wnB6bGSVkASzRMot1pr/lkNwVXfyKGUgL5WwthyP?=
 =?us-ascii?Q?qwFbfprYvtrccBloEB2cV0B4lxqNhlVIhEVEaIkc7EMB/Wrmwlw6W0mx4Pcu?=
 =?us-ascii?Q?Brp6GBw5F/ZCHToiKwfxYoPRGntC8T8Zgu7gPYE+MLehD2H1m/0oMnHH/c/E?=
 =?us-ascii?Q?Jj+ysaDm/k4Jj6b94iXxHBysDEAdRk3JUWW3qrxEAE5B86rvqLkM89Ze/nOe?=
 =?us-ascii?Q?Zgu0Z2MeoA8SZ/j+MvnWwW/VGieeCDDNgDdlsMhhiXzq/NED2LfoszufXrme?=
 =?us-ascii?Q?FQqZhRokjx+c1FjNsCw7GMjOr50HHyNRoDkBegT4INCkMjwa1ifwC7qpbXvr?=
 =?us-ascii?Q?k99jKaueAYsQMaUG1gYY2evIIY63P5uuC2iEnHQyWQp6a6tcHMqKNtqCuFgt?=
 =?us-ascii?Q?NqSdTns4KLtncKyO/6pJ8YHc8q+9xopRFF6bUz7LnXtjdi9vmseP7L03LA69?=
 =?us-ascii?Q?6nF/kUE374D2JY8Yp20rs9sfjzqjMBHbtoo3yQyQyNpzP6VF7Vm+6VNfDI5g?=
 =?us-ascii?Q?yr61UfE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P193MB0738.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tod7tovm7WlpJ9/z0czDDvPUahU0Ey3jy6reJ4Jk8DTHkscRYG8WxcuLOJiH?=
 =?us-ascii?Q?CFcSGFOHgMEgm/G4rol/J9TBMWguJ6HVEyLzYbHaidHs/znX9ro1NJJAbdd+?=
 =?us-ascii?Q?grOAmQaEOp7jb/KkBRdUyyDmWIcaIGdY9TXDGl6Y5P9g6/Tk40GUGJ4Do+x4?=
 =?us-ascii?Q?jzc5J8BJHPwgtoT1VTmUOhrGpwPJqmBzgFW/wrWj9czUvSn3CIAjOXZiejQc?=
 =?us-ascii?Q?c0rdu8QJdkyuyUx83YC4IMGIh/zpOMEfe5CkCES8nX4uQbEMNgaXvA8luXvF?=
 =?us-ascii?Q?NaVbgq2WHYBW8LeIY0J8gMbwOaq4X8+54aY7FDc3S2tho/iKqACFbHu8h2jn?=
 =?us-ascii?Q?qV8zxxjKnr0w6Al5MVIcarVuHpCLsa3daRXE9cqTXacSsVofULo0ypKV5dZo?=
 =?us-ascii?Q?JQBLRKdGm0FR609DF1EeJFoGxJLn7b7WrS2KaOugtyR8HMp/5eOR3WR/4M0l?=
 =?us-ascii?Q?+gGhPx/SDCikPpzKa1E0/PKfu0Qkw4kLPsBwU6SvhfnPuQPTJlgYbRT8mtxf?=
 =?us-ascii?Q?GJEvCV70BaQBvFvRdrmXj3vn70+kdJhJWEAs4AJ4dj6YwgTDV5nuuk7EfBVq?=
 =?us-ascii?Q?DakLjljgyxSvpocoE/CCu/KUd0DLaM0BIqe8T+QJbU7JLtChzl3zz91X3t3/?=
 =?us-ascii?Q?FdnxUMr8fE4R5UYjynSaKtYHAFyf2XqCiORjWNF3fOfKDc5Vr+jJE6zIuhw8?=
 =?us-ascii?Q?G+sd8htTeVgWXlIpATj/fVYv7omSAh1zW7zC8mnw1Y1K3lx34GdwIZlnZE5a?=
 =?us-ascii?Q?MigT+gddyrrFYt0LDiIXQNLmWVyqQW/wphpRZPp/qCF6LwjmoavUM7EbFwNv?=
 =?us-ascii?Q?IeTXPO8I5d5MPLysJw5NbAg6QrZRM0uB7lV7usnq2y/bxMt5tGsmLc69530F?=
 =?us-ascii?Q?uqp8JJWpiaVU9LPJBoF0vAzcJ+2lWHVWfiyrPQPYizASmytkrz99yO5rsEbc?=
 =?us-ascii?Q?TOH1GXkPGDJpK/IvTlqLoEPtB5fXVUoJ3suynhKE2rQl4UAv0UMgsjAj+wmi?=
 =?us-ascii?Q?TE0StHIxu8xiSaVI0oEbXiueJC63GXUsEW3HtbIHbEkraWH4d3Mw5Go4HoXe?=
 =?us-ascii?Q?vQv6d4z8iJiy8qeIYve8ZVbwbCwDaEeTrfAN5QQLyem4OU1X05WfEAn85NDA?=
 =?us-ascii?Q?6hwocpYPy76oTyGT3Fsnnwe5AzCDuOsq2rLL6jDKdp+66CWfDfuWLSF0kbZt?=
 =?us-ascii?Q?gGOJgxitSFV7bh1NkMbTPZhA7MNVLUSIVVxJhxa/bbL/X33/zqj/tfY7KxP9?=
 =?us-ascii?Q?WvYtKvbwnqlUe1GDR2EjcMzgugqA03onEj1p/e1xST7pH3qOXnRc2s96jvYU?=
 =?us-ascii?Q?Uiu3ae0363bAmu2U124hwmcuPBAn+1t4JQ10VVikwbNQ9W/xX376f5u+6Cee?=
 =?us-ascii?Q?3vxseZDvRzpuABJ/pH2spUNMHxB/MXugUF1HJ+2EgXdafVbH92UhdxBwSUQz?=
 =?us-ascii?Q?AUmxLdtiAcPvu38ikOhQAsQqNSD9snIr5h6VDp5EyaqsWLjfSCtHa4vf6NtM?=
 =?us-ascii?Q?7vy9ZD56ZG7AnHvZMxZM3anx6HwFJpyKG5n0W9gYF6vpsuAK88oFeQVSR38r?=
 =?us-ascii?Q?k0IzO3ecFYvDxzH0ikSxscWz0mVrx24IqGst+K5MKAvPdKhKhMoxiTVkEMiM?=
 =?us-ascii?Q?pw=3D=3D?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7e1603-039c-4aec-8e2a-08dcf26fcd82
X-MS-Exchange-CrossTenant-AuthSource: AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 08:01:58.4389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tKgnW7R+JRD0HutOb3wIELRUVo5kZSd7ztfl3G0+XLeKjDX1M9TUZAFt4AWbLLafKLlvXPCafhlG9Zr70gjxf9nBBBCbojKmCGi1by7yHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P193MB0497

Hello,
this patch series adds a dt property for the pcf2127 driver to
configure the battery switch-over behavior.

The default behavior for battery switch-over has changed with PCF2131.
For PCF2127, PCF2129 and PCA2129 the default is battary switch-over and
battery low power detection is enabled. For PCF2131 this is now the
opposite. At least PCF2127 and PCF2129 are not recomended for new
designs. This leaves the PCF2131 as "replacement" part.

This patch series introduces the nxp,battery-switch-over optional
property. With this property the PWRMNG bits of the Control_3 register
can be changed.

I have tested this on a device with PCF2129 and one with PCF2131.

Best regards,
Philipp

Philipp Rosenberger (2):
  dt-bindings: rtc: pcf2127: Add nxp,battery-switch-over property
  rtc: pcf2127: make battery switch-over configurable

 .../devicetree/bindings/rtc/nxp,pcf2127.yaml  | 10 +++
 drivers/rtc/rtc-pcf2127.c                     | 61 ++++++++++++++-----
 2 files changed, 56 insertions(+), 15 deletions(-)

--
2.39.5

---------------------------------------------------------------------------=
------
sps
Smart Production Solutions
Nuremberg, 12 - 14 November 2024
Visit us: Hall 5, Booth 228
---------------------------------------------------------------------------=
------

