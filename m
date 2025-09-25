Return-Path: <linux-rtc+bounces-5023-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FEFB9D854
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Sep 2025 08:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB4381BC115A
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Sep 2025 06:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13412E8E12;
	Thu, 25 Sep 2025 06:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="skO4P0lv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013071.outbound.protection.outlook.com [40.93.201.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A72F2E8B8C;
	Thu, 25 Sep 2025 06:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758780266; cv=fail; b=WHX/1WFLqbor3OI8FyoO65Kr/8UBXbneHmgoXyxYi9MQpuWjVDnzozzhnZN6gmhbbyRQUJBF4idpz00UTpzDDq8qgf6zLz3RSPNT6uv0FErKvfMSlkXqZf+1MY23z7KQUq/FPe70TI57vIWpcLTs8gdYEI5sWtvyaE9f4xuWt8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758780266; c=relaxed/simple;
	bh=KXemB6oOdIB+xzluWAtmggAIZhmcGEqegOvmPSUUrUQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pGFheiobh9cOystl1y7eb5SJbmu8FNotUA9jc0VbLqgl4gFrDPnEtK84fuaJcfXKWIFOkfP8jsrYOr+4crwfSdVzq6cUKPimB57J3sEdZ1UNdHQadF44NJmQXl8vmiq0br1lyHjnBbaIJhT8am/RvfkAsKraOjf1KNFcxqILEAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=skO4P0lv; arc=fail smtp.client-ip=40.93.201.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zk2IZ5RcjL5WpAtA6Y8HNE2qCUgpvaOLt/hNuENuRT/hNKoRYohBqN6vAqvBaQ1uYKyvKBet5AMAElwH10/mfoSJTv7zVUqe+6fDx7ny/IEpKymratX/KSZZg+kDonGEZXO8irZs33DNuzyCOgY2NBS0DN506PPIaVzACn+MCYsZiJtLym68veAMYVzE5f6QRRYqcap6q6la6TfCextSjcfrMvzjnaY0RvA869AHOMLhyGmm6hmzJm62uiP18u/y1CUBy2rFHDfggQ1xRzIxw1HaZjblU6XSstNXyj/4xzZ24qKbH4MA+lj3l7a0llwXiDU4Z32Z67hpicepWzccJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BE48LGd8Du5MiKKvglrn1AproCC4GlipHq5F9zopUYA=;
 b=anX7IVOpQ2WZs5CbWOAJS5jmHgcEKQWOulnQYnwdnd0X7GCjJrnWdhM147Eg8QmI9is64WVhLgK2viChDN+XboF6yelHj+1UDkXI1ihXP6CwPBT4YdECWo8DH57B2ZS/x1XqkSZmDKSDZlvKnb40OtKbY0Naqo89uU9XgcY3i+y33DPX8UY4hlQ0UJti4letmU7/19RHP9X87hE4zbP8HLcwlwdN+aTsgRoge7VKbogHG28oBcJ0j4OPCRJoOHZx//Wabn0CdBIlz9Pgq9RHUdxhjo8Pvn8XknEFiodWYHYK6O02ZEdLIAq1pSL5ZipTGMJEJl33PdepzqRYijNKQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BE48LGd8Du5MiKKvglrn1AproCC4GlipHq5F9zopUYA=;
 b=skO4P0lvLQrumj/uVC0DlLyQ0xPMv2opfo7AqzFq3+SqtwsnchYTfZQODJmydajCWbgMmrW5iQNgFYR0kIfehfVvPcYkr/B99HEzUv9RFNcag6QdG4kLTB7Wz7aWh2eshJDh7v7oLsgFVdIBRAyXSA6FQv4GKGQEFWImR4E/iGc=
Received: from SJ1PR12MB6076.namprd12.prod.outlook.com (2603:10b6:a03:45d::10)
 by DS2PR12MB9565.namprd12.prod.outlook.com (2603:10b6:8:279::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Thu, 25 Sep
 2025 06:04:18 +0000
Received: from SJ1PR12MB6076.namprd12.prod.outlook.com
 ([fe80::415b:4f92:5791:b46]) by SJ1PR12MB6076.namprd12.prod.outlook.com
 ([fe80::415b:4f92:5791:b46%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 06:04:18 +0000
From: "T, Harini" <Harini.T@amd.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [PATCH V2] rtc: zynqmp: Restore alarm functionality after kexec
 transition
Thread-Topic: [PATCH V2] rtc: zynqmp: Restore alarm functionality after kexec
 transition
Thread-Index: AQHcAV1AXhRPyjcD+0u9TsGzWke7IrSByXbQgCH3+XA=
Date: Thu, 25 Sep 2025 06:04:18 +0000
Message-ID:
 <SJ1PR12MB6076CAEB3B0429159B4151AA921FA@SJ1PR12MB6076.namprd12.prod.outlook.com>
References: <20250730142110.2354507-1-harini.t@amd.com>
 <DS7PR12MB606995B08A344C01711C7BCC9201A@DS7PR12MB6069.namprd12.prod.outlook.com>
In-Reply-To:
 <DS7PR12MB606995B08A344C01711C7BCC9201A@DS7PR12MB6069.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-03T15:22:17.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6076:EE_|DS2PR12MB9565:EE_
x-ms-office365-filtering-correlation-id: e0d7776d-56f9-4ae0-c5d2-08ddfbf95d00
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MyU0gBMeeADmwh7XmKfuarqVyTSh4eIv8Ove3WW54EzRo5D0ARGeD7Mt1RAm?=
 =?us-ascii?Q?6p7+cjmxhlnXBagfuxtwEWjJquaa5q7oyWGypm3yTrrfPdZcO6yzITJP1hwZ?=
 =?us-ascii?Q?fnmsN+AVpxrvL4LDGRJpEfoX/Z+GucXg6SdvVn5qfjHXykJSbTb4pF4tsCJU?=
 =?us-ascii?Q?ZgSOoYaa9pMFn/xeXRrshEYsQmidrnsqXLZ1l7g5kkQr1cg20bNBHHD9/82l?=
 =?us-ascii?Q?Nf3dNClbWA0lfD7JVUXbzCKC3dFiBub9fLWjwfROaGgC+Wy/MF8WitLy6xLZ?=
 =?us-ascii?Q?dsyM4WcXJUSFzLwtaOZ5uQrAGmR6zCwD3PiVsr7P4FPijhviGakepsonjdOC?=
 =?us-ascii?Q?ccm+cZgFOMXrPBu0xXGX92oUIfrdggC4QLpjf9Q9NnBee8kgxJkw2aBPDXY9?=
 =?us-ascii?Q?OnD74MPkNagHUKI/o4fZzPSPWi/ug0vXd3XufQExuSrtdQIdh92anKTzxPW4?=
 =?us-ascii?Q?m8/P0KjKgyMX+NT9BvppR4GjHIOCLcGPkr1sC4hUBhMeQ8/+pXeo9fSAvZ4a?=
 =?us-ascii?Q?5aPtEVIessO3putmj0O77zwQKqFOsLgI62XDfOLhG+cYBTO5WvFShggiFQ/I?=
 =?us-ascii?Q?48zbGmT+Q7HOkrOyFR0qADs44hDl2mcjR+4ffvp/etUdEvRGG9Ew85aY/zFT?=
 =?us-ascii?Q?VCp9PAZV5gpKC6BqecG2EbgfZYlgchvlZyMiGX68+IicGErd92uJVK07tG47?=
 =?us-ascii?Q?sl4UXStv6wadUT9ALJgwG9l2A/mVDBLCdDErlLIOH9NTMU+NgLqCWhN55XvQ?=
 =?us-ascii?Q?JBISqYDUIm7PAdRYfK36/cJm5Xeitv6YdDd6fVgsK5sTUQZb8evNEzkL8Hqj?=
 =?us-ascii?Q?MX7Vi/l2T47APtoOrJZtB5VnU7N7lWX0xGj4UtVPluzklsmMZ2c2wYMnUUeP?=
 =?us-ascii?Q?0SmjyPP30u4qquMGw5+QzldHwmQxmyEzwt4hqw440IbSsTHXTzuJ3n5mIzOT?=
 =?us-ascii?Q?TL1Ami5WpOhoCf6aw5cU7FwKXIUmOXTZyLSRE1+LMFgqMBlmCsF0BLvVa7Zv?=
 =?us-ascii?Q?ZejWxvmSBemIoNcN3ulkZJcfaqlqc69yXP4/FIm3di7WEmv7IwjDA3mYaAuB?=
 =?us-ascii?Q?kanscZ4+E08j+CLu0Y5eGGKgwUPXduStGa7qPuWi//pQ2NP9GETZUwP52W1E?=
 =?us-ascii?Q?Zdbbq2HCNC/pJeCblOpyaBUhvsiPVLovnE5XAcAMM19XKVE0kxDa25BdQuQt?=
 =?us-ascii?Q?85I9tccpgDpKQGn0wdZJ51uy++y8xwznZvLBafC12c/NMkefAhs8oGQA/jvY?=
 =?us-ascii?Q?uUvJqkvScAgMJwaLefHv5tvWf7tUmSmmKK827Hlro/5T6dZc7LS6KWa8tbHR?=
 =?us-ascii?Q?ROQjamVFGzJKBEaR96pgVzp5ZqeO6xPWnFLMqHZJeMMuNTYuQ+ADHjkg4Dg2?=
 =?us-ascii?Q?msSebFibRVXwU0jfFXqM5z2pylbiCdFPK0BI33Itw7lHKruM0J26TJsO55PS?=
 =?us-ascii?Q?N+liBR42mYpkKVRuhzZXG2whKdKfibB9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6076.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ruUxucvxSpYtXSjhvq9ds9k1X4pe9aJ/EqqRO9s4zsbnkUT3P3/R90oWld1a?=
 =?us-ascii?Q?J0DOidUcw/zaAK6HKpYtPYa99zXMdE6+wJHRR1SDcY2cUN9AA5V/MSf4KVCx?=
 =?us-ascii?Q?oy3AXkuu53MACT4iE4RgNqUqYbao/vmQRXxTKbR8hlZxq8wfpLPXOWKh0XJo?=
 =?us-ascii?Q?fBLRGGh9iQl1OYqff9cTrqRnB4JtVRUNav0DJIULwABhItWpeaZqvRaFf3cv?=
 =?us-ascii?Q?TfqX92aVMcQ9TjETTJNew5cLZkhrRgpzoNetMf5u6sz9hox1zvcdJhC5Qucc?=
 =?us-ascii?Q?+WG682CratKU6rXkIwGNOvwLaD3w0U6tXZwytbYCRkzPCoi5NyPvHQM+UEjC?=
 =?us-ascii?Q?zJfY/7ZhBbKDCx0QYDUJ3pZB/cMTw/H04S6YNT2j1gIOJpfcFEjo5LPp37nu?=
 =?us-ascii?Q?ocmvG0BDGtcgYul0oNqOXNkTacX5OXCyzwXqqZeDLz55sOy3nYEA+oKhtCRZ?=
 =?us-ascii?Q?WmewTlv/H78K57TalAzKoCaa2yGM4sEM2qmQhD/eZzHqJr72t5/39nzfRoTt?=
 =?us-ascii?Q?7DqByTyvtnQsWkPAmhOmsmzQt/3jiXnI2mpXPQriz+3LNHCjc0B7QVuFPd+V?=
 =?us-ascii?Q?+cw9GuGY8QoaJyhoH9EsNyLHARNQ8ylIjvMZ1m9EDEKSvciX3PkdGBaOW+9L?=
 =?us-ascii?Q?XfKW3z5Nof5MCDQ+Ae7HcwFAuKxuhqqZcCHQKJyPjBSKq3Uhv1mCEozKALti?=
 =?us-ascii?Q?lTKI2DqXrL2WJwGD/tTWAABT4Z9vfcggg+HsiDjLJ1xgTK4q3K9X1JI5OTLn?=
 =?us-ascii?Q?3cvOsIyvHKKS9C/vpQ6W9oUhfwunksfyUW/yPWbUSvfBgOH9JHofONPLLZfU?=
 =?us-ascii?Q?s8iJZJozZ9A2ApE+TCRZvzvSC5PkZuNBI8gG9WrzdzC31b1ItfqhAWEC9Ejw?=
 =?us-ascii?Q?nXcrIwQfa+NaMs31mYwIw2pC+zVg11dUoIi5U8bZ7LVDc/wQaObzDKuyQQHm?=
 =?us-ascii?Q?Wiz5Hi58PAPITHdC6RkYqc6Q1d7rgfmVwrU8Bsc9BaUveisirm1aFSeCBm/l?=
 =?us-ascii?Q?w80sRARHLMQK+zl6WR5KQqALycMbhrwoppjVSDV3UWk1N6RVrI0SNJTe98cY?=
 =?us-ascii?Q?9/Eqru4sCe/nIPEIbq875hpcCE+k1Xw4wT0ZWyn0waG6YVL3qsmFF5hJ/0Ue?=
 =?us-ascii?Q?4lICxVuMJnSoaRW5IwsalC94ccLS4FvfgCZv/yZV8wQG/x+XTxLDPojcOCJK?=
 =?us-ascii?Q?1bdcQZ6yvMfST3C34J0Sfx/FEqufA2RTtH9BPgHwv2YTRggx/x3KrX7twz9R?=
 =?us-ascii?Q?gLQEmsAv+dnF9ThOsBsRAkYdSeZiPpmkWQvbS4xNENa3hnLluHu1JId10DeD?=
 =?us-ascii?Q?xUjJJkSnNK2Jr0gKhp0gjaL8XDTvC5Eta7ScbPio7H1tew0DDZvnnObOWV0o?=
 =?us-ascii?Q?GF2f/Wix/6VJ36HYfAgJ7KANPiP/Nrf+Ncrcmy3OJ0T6RDc5DoTAe1pJ8VMf?=
 =?us-ascii?Q?PcSc4LWUIK1ta5zAnyehEY0sC5y58h5NAt1qkNaPRU1s4nKK/MSSBikTZw9H?=
 =?us-ascii?Q?aVzeNFwhxAtfqxqsRuTHTh0eBX2StRx6hRHh4ldD7nzBmB/61K9Wyn4HBCfO?=
 =?us-ascii?Q?EOEu7B/Yr62td78FVGg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6076.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d7776d-56f9-4ae0-c5d2-08ddfbf95d00
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 06:04:18.2078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s6ShdufpUTUc1uqr7vBjdZMfvn5X6IWVmbwPRfbWkc8R7AEkIFzzhumCeTNwJg06
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9565

[Public]

Ping!

> -----Original Message-----
> From: T, Harini
> Sent: Wednesday, September 3, 2025 8:53 PM
> To: Harini T <harini.t@amd.com>; alexandre.belloni@bootlin.com; Simek,
> Michal <michal.simek@amd.com>
> Cc: linux-rtc@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linu=
x-
> kernel@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>
> Subject: RE: [PATCH V2] rtc: zynqmp: Restore alarm functionality after ke=
xec
> transition
>
> Hi Alexandre,
>
> > -----Original Message-----
> > From: Harini T <harini.t@amd.com>
> > Sent: Wednesday, July 30, 2025 7:51 PM
> > To: alexandre.belloni@bootlin.com; Simek, Michal
> > <michal.simek@amd.com>
> > Cc: linux-rtc@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux- kernel@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>; T,
> > Harini <Harini.T@amd.com>
> > Subject: [PATCH V2] rtc: zynqmp: Restore alarm functionality after
> > kexec transition
> >
> > Caution: This message originated from an External Source. Use proper
> > caution when opening attachments, clicking links, or responding.
> >
> >
> > During kexec reboots, RTC alarms that are fired during the kernel
> > transition experience delayed execution. The new kernel would
> > eventually honor these alarms, but the interrupt handlers would only
> > execute after the driver probe is completed rather than at the intended=
 alarm
> time.
> >
> > This is because pending alarm interrupt status from the previous
> > kernel is not properly cleared during driver initialization, causing
> > timing discrepancies in alarm delivery.
> >
> > To ensure precise alarm timing across kexec transitions, enhance the
> > probe function to:
> > 1. Clear any pending alarm interrupt status from previous boot.
> > 2. Detect existing valid alarms and preserve their state.
> > 3. Re-enable alarm interrupts for future alarms.
> >
> > Signed-off-by: Harini T <harini.t@amd.com>
> > ---
> > Changes in V2:
> > - Remove shutdown handler to prevent alarm interrupts from being
> >   disabled during kexec transitions.
> > - Add alarm state detection and restoration in probe.
> >
> > V1 link: https://lore.kernel.org/linux-rtc/20250724170517.974356-1-
> > harini.t@amd.com/T/#u
> > ---
> >  drivers/rtc/rtc-zynqmp.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c index
> > f39102b66eac..3baa2b481d9f 100644
> > --- a/drivers/rtc/rtc-zynqmp.c
> > +++ b/drivers/rtc/rtc-zynqmp.c
> > @@ -277,6 +277,10 @@ static irqreturn_t xlnx_rtc_interrupt(int irq,
> > void *id) static int xlnx_rtc_probe(struct platform_device *pdev)  {
> >         struct xlnx_rtc_dev *xrtcdev;
> > +       bool is_alarm_set =3D false;
> > +       u32 pending_alrm_irq;
> > +       u32 current_time;
> > +       u32 alarm_time;
> >         int ret;
> >
> >         xrtcdev =3D devm_kzalloc(&pdev->dev, sizeof(*xrtcdev),
> > GFP_KERNEL); @@
> > -296,6 +300,17 @@ static int xlnx_rtc_probe(struct platform_device *pde=
v)
> >         if (IS_ERR(xrtcdev->reg_base))
> >                 return PTR_ERR(xrtcdev->reg_base);
> >
> > +       /* Clear any pending alarm interrupts from previous kernel/boot=
 */
> > +       pending_alrm_irq =3D readl(xrtcdev->reg_base + RTC_INT_STS) &
> > RTC_INT_ALRM;
> > +       if (pending_alrm_irq)
> > +               writel(pending_alrm_irq, xrtcdev->reg_base +
> > + RTC_INT_STS);
> > +
> > +       /* Check if a valid alarm is already set from previous kernel/b=
oot */
> > +       alarm_time =3D readl(xrtcdev->reg_base + RTC_ALRM);
> > +       current_time =3D readl(xrtcdev->reg_base + RTC_CUR_TM);
> > +       if (alarm_time > current_time && alarm_time !=3D 0)
> > +               is_alarm_set =3D true;
> > +
> >         xrtcdev->alarm_irq =3D platform_get_irq_byname(pdev, "alarm");
> >         if (xrtcdev->alarm_irq < 0)
> >                 return xrtcdev->alarm_irq; @@ -337,6 +352,10 @@ static
> > int xlnx_rtc_probe(struct platform_device *pdev)
> >
> >         xlnx_init_rtc(xrtcdev);
> >
> > +       /* Re-enable alarm interrupt if a valid alarm was found */
> > +       if (is_alarm_set)
> > +               writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_EN);
> > +
> >         device_init_wakeup(&pdev->dev, true);
> >
> >         return devm_rtc_register_device(xrtcdev->rtc);
> > --
> > 2.43.0
> >
>
> Kindly following up on this patch. I would appreciate it if you could rev=
iew it
> when convenient and let me know if any updates are needed.
>
> Thank you for your time.
>
> Best regards,
> Harini T

