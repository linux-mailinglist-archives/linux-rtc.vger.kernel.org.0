Return-Path: <linux-rtc+bounces-6071-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGGeFDNqnmnSVAQAu9opvQ
	(envelope-from <linux-rtc+bounces-6071-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Feb 2026 04:19:15 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E95C51912A3
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Feb 2026 04:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7F2030466AC
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Feb 2026 03:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F482BDC27;
	Wed, 25 Feb 2026 03:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CzXB1xDq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021107.outbound.protection.outlook.com [52.101.95.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B4629D26D;
	Wed, 25 Feb 2026 03:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771989548; cv=fail; b=Yhapl5we45kXf5T08LSoRBbStWD3H5m61NRtTgOesRUcZwO9iA/N1BKXIFZ+VoxMihj6cbO9THAk6rHvSDbduupyIUSi5blInCPmsoq2VYq8uyod3ZhFq1UT7FjjeImyZruJ+wqxadQ39NSgaggFR7vUIEQqTUzRbiPUKB6j4WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771989548; c=relaxed/simple;
	bh=F8B4vwIOPMTUySEUXsSP5bm/evB/lYGbSTGllxRtyjI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=j1Lm+QBa5cpUq6MrH/B8PPp6FfMacjzthnLmSEiP6ukYXRhTh5oE5P8YBSG5FYMv5SBjAqP9GTq7Dq0WffLkbQG5y9AAyK+9t3aJIbqQdDo+lyzXAPol/7Cstaa6IsWVPkidYtdLmJthNOQqJKlsW8J4AEm1IxU+I3y9rF1D0t0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CzXB1xDq; arc=fail smtp.client-ip=52.101.95.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYp+Lzg0Eo/26rBO9fpZ1ySfsS5VBMfrPRHqrC39/6x/WTsgTXpRz+nnvbG7iAAcODcmE2Anyr3mNM27fIR6TRs2ZwW1Oi3sqeMZv/lUek/AVNc/FS3a633hSXrmGE2OG/VIHwfaiNiycHtQzIUwPa2pYMgc0CtOGuM6WC+8aY/yQwB0a1G5GemHElrm+wTmG5wnmHDEDtrOSip/9ts4zITF10DhGg2etKO88SDHTjrXGRCsh5MceHnGeJHbVe08J7UGFPXoVJ2sGso/q6hOEMbXLMWrqDV9uStsTNT8xGs1NJUxqwR0c8c8/6dLtG6E4WyVk3pzKs3KMLc+IVcKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cx3GsYQJZMlkRxa9khsPPI2Y84SfXzHF/ch4ir3Oe2A=;
 b=QX1XB+4K1MkIxrGRKfZExYjwmdAtGmByuHK0mbPbvjnW8YHpUsmdS4jsksLWVdFU0BDw9/YDvS9NezfoSoB6ui7nU6B/1O2rBudV88z459sAISa+gj94MBa64GHDTr/0wW4S38B0Lr9IuyqpWvlvU0HJjGZpo7S9/NZpwNDoaJkkyNvNMxlemKD5NWwPH2txyfSKfeODs3Lg5ithhSlKyoya5Hx2f54UnpzT4HhDbc7wz24DDqYxd46A0WYJvBf+CBJ7AFjrYmsAtiCJ+8ZuJiqTltbyOoI4Tr02QJYsvNliSteE6mnnD6JNAP3j8g743mxvZE186fm2YR+QzSwOOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cx3GsYQJZMlkRxa9khsPPI2Y84SfXzHF/ch4ir3Oe2A=;
 b=CzXB1xDqAfCM0z1cUjwq3jwsui+bgSmcWWuPvGYQOmWSGHKZooUgrPpsYBOMYMlxwnA8e68kIXIfP+EdZFfWFZNpSMxhzCnPO+8JEFfI8K5GtI6HomkrGfgDmaEWs+V1BM4QPG8p8CrL8vHL3C/k2EUOVqAmNb6qz2V6bIlfzms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5235.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 03:19:03 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 03:19:03 +0000
Date: Wed, 25 Feb 2026 03:19:02 +0000
From: Gary Guo <gary@garyguo.net>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Alvin Sun <alvin.sun@linux.dev>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj?=
 =?UTF-8?Q?=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
In-Reply-To: <20260224224449f141e366@mail.local>
References: <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org>
 <20260222000556ea1938c0@mail.local> <DGLI4H9M0T6D.25RTLDVU5JRBE@kernel.org>
 <CAJZ5v0gtiQxBCknkaOzLKrDqUQfhKh_UjQkvgxJBL4UthbCOkg@mail.gmail.com>
 <DGLMGEZTM7E2.Y8VV9I6LI1P6@kernel.org>
 <DGMR9XOWP1V0.3C9219TYPXV6J@kernel.org> <2026022415010804e28202@mail.local>
 <DGNC6GEH8EV7.2WWAQ8DNCLRAB@kernel.org> <20260224172822de7f4569@mail.local>
 <DGNJKZA00MNT.2C7NAQYG597MO@kernel.org> <20260224224449f141e366@mail.local>
Message-ID: <0818fed1ab11f54f899917b6bd87cebc@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: 40565259-2b3a-4c68-cfe6-08de741ca066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CxKSREAqT3xG+uMPaD6g0U3yJM9rQb5s0DknJj5+39fGGxlXIpByp3R+ToYm?=
 =?us-ascii?Q?1gkMCsX2NC8IRJwZPmA0MLuk09eAYCHQ1nRLK7NjXIy/sa8mlXHQsyKF5l7z?=
 =?us-ascii?Q?ZGXQenIR9NA4QohMwqZUOosfC0IX6rrnbenXAIQibODuLZa4GbVnKvXNqwWn?=
 =?us-ascii?Q?ZTmIX3y+uAb5Tg81yiDVA0O+Sb/uVfF2mmHAY6wRDxHYGLyazY22HHCoqGGo?=
 =?us-ascii?Q?AOcuEyH5m8tca812SN+fxHgNDvWDLqGbKlfv05BCdW9EfQFifiCTZiQdJuya?=
 =?us-ascii?Q?he8bItsVOPnL2c8VAkhOTXCr/F3AKe78cUcPDGd44ubz/mRINtNUGdz2SflX?=
 =?us-ascii?Q?9VwFgJwMAGVyakEjvT8D+t4urEYX0YZJudZnRnuda+d+Rbp+xNzbBZvKF6hC?=
 =?us-ascii?Q?HybtlKWSpW0UB4bqZ1D1xLGxd7k+XxbYe5ZM8eC0VWbFsRUsE3A2HkkFPBfC?=
 =?us-ascii?Q?1fE9bm3XeKqna1dVtDUpHZO/x5mBF/tTBGho5L/Oaqv9QSBvx+hSOBQ8FXWd?=
 =?us-ascii?Q?GGamjXcMA5J0uTkXiYauP0rcr4CtvZxoR6iMdRYUiyqTYsddaOwZejY48MQo?=
 =?us-ascii?Q?DRMmnWJQYzugW468DxcLF58C8f0IAcCK2dYCt+ow90JZ6VkNONdGyXFcNJsq?=
 =?us-ascii?Q?oOE+VSrgRWWzmiILVWZaWfVVKuzwjUDVsekSse+lm9PiHPOfZ0H16lVznSJh?=
 =?us-ascii?Q?RGLYVzRNSe4chjEi0Qxo4wDtt0YB13VNGNJtBsO685kWqNPkrZYjblMFnmee?=
 =?us-ascii?Q?JXN1ClX8I83JGi32sFUfXOC8V9aYKxnR8R1T08MEPUyPT+ZHCialA7o9aJva?=
 =?us-ascii?Q?zj9rARiE+aGE+5dqgEoQHGquBiewO93QoZQGEKWUkusDC5nsYafmSaiT/WRr?=
 =?us-ascii?Q?JF7s9xTNjWS4hv7Tmys4I6NqZRXorTXUD5LIUR+IVU1S4SmgZOjxTMqEYQvI?=
 =?us-ascii?Q?UlO2IaD/TAkiAvvze3Ppq+ZeA6cmus/xof5+xsB/JwD9GCAKWR+qsS9rJES5?=
 =?us-ascii?Q?3B7jHzRcZdC6cXZlatIZHsFFlgqwdhA7BvC3PkvQDfyhFDj4L63edku7R+jE?=
 =?us-ascii?Q?Uz2/KJGEXNg77Pu5b9zvQIxKqkdwp/iTtEb60DVr4DGlHahdWBzWW7zXdIeH?=
 =?us-ascii?Q?dDLEI4/PPIMYCcsImbVdmkp1y5Twhhc7fgNHW9rt1Nrf0zASADPn+ODZ+VDr?=
 =?us-ascii?Q?LBulYsk3hApIioaZ0eXI/UI7e9K/hrhzvIcilmHwhCUEtm+UNp949lSLPURX?=
 =?us-ascii?Q?PXNovntrsJ713FdgAbwIobvkjeh8z252Q7OYhyRijQ7yHulYGcFeppXQneAC?=
 =?us-ascii?Q?W0qCRTmREQbOty6OdHrAYIlJ68htEfQc3gP9eOkMPQX9VkQgue1oSotsWeb7?=
 =?us-ascii?Q?ceY8cjtgujmRXZeLwMyYS95u8Su5QlgO2ic1aWRX6tK0gZ5Wq9rJk6/go0Z7?=
 =?us-ascii?Q?nHG0tQke96Ns4YgyebeA3dJWEMr7UQC+bkR6aJkbEj0nM2iPAxGeQfgcrtty?=
 =?us-ascii?Q?k0mFtdbCM9Vw8SIISOsLQzaxawh0vJYN9B+52Dbsfi2eo/2UsFy4FaRcwtxG?=
 =?us-ascii?Q?ddgKi9LNgUZ6Ockuyfo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tNy780BW+PIF5a3YF9ckpY8FsAGOEdQzZhS+x32SuCvS0BkTizi+KlGsyOuZ?=
 =?us-ascii?Q?r9yJ2uN26O+4/iNx5zCA99Gz7m3iSQZ3wzvg2fmzGHuTqrakxIFevS+kP2er?=
 =?us-ascii?Q?eqcFJ7Ka5WVb6SB6hQjuLthVX59BKZPJ1uHtKe+qH2RPs8ej0uH+HB2bNpbO?=
 =?us-ascii?Q?zvX0okSvhOqXtgL3JGBeWw9LhXDuxIN650BvFu7N6Eb7KWVOHk6QvVF4X5NI?=
 =?us-ascii?Q?ZBLDeCjYZJ/ggQZEiImPdFFhqnNLis/9PcNJ6pLX3MqWlWZadjZdyI0OOeXt?=
 =?us-ascii?Q?gkW5LQ2FaHYrz5MKUNvmEEdyz4kdAnHpHa70nB/l91YGgibqmJuPTDA3kYA3?=
 =?us-ascii?Q?k34YULfDBTLZH4UvAt0NX4pfkOiet5mnAR4tLjFEaDwE72RhN98nu+x8LPer?=
 =?us-ascii?Q?pftnA61+UFJl3ZSszCBipzXapuCZDw2fkUk6wLDrvPyazmSwEUZBZ7FXueGl?=
 =?us-ascii?Q?qwAAjwWTmsTCF6/ni2rJnySvJaTkEU063iKnRwXGyCgsxthJSDJo/uSykqzt?=
 =?us-ascii?Q?E23Q0f+TsO4Ap4nMSiMpQFHEojYfk3qHuWMKa5mkFtZQ+d8zTLunOMwwcCQe?=
 =?us-ascii?Q?+uA5l7PWTbZb/YGB7l6rM8SqyUpb9lFPpLcTiJJ0j2dTfB3jfj4GkjvWHP7Q?=
 =?us-ascii?Q?FqtGRaAo6RwrunNAJUSTMDzWST2n0n1Xy0+Q9IfHlJaBm5aSYkN0+HFwcxjW?=
 =?us-ascii?Q?z4rgFzxfd0Y2D9RDCmGXyD0i9+r/fgQdmP+Z8ILNpuyz+cpMuJRuIo5BedYC?=
 =?us-ascii?Q?roLcpUn4Pa+XApP+WiTk6h11DMVdBa198GcDqQtlNHPBx9t5devOXPghrIvj?=
 =?us-ascii?Q?lAjHvy0n9BniweNi1gOfaBJjbKnJuBRy6HcwAjCRC7Q0bCADf/KJPePYZwpI?=
 =?us-ascii?Q?TZ3hLzU/a6Z0OMkKL4TLtw/0/ePehzTQa95GRMmHoxjksxpMoIAQPqfPY9hq?=
 =?us-ascii?Q?tTsGQhiUNTIxMX0NSn895g7IGzFRbgPv5CIi1Jg53vaKFuPgr1JRIjrWhyEP?=
 =?us-ascii?Q?AqDeGnjgNpFnssZmwT2amtHAxKehIbxKGR8huMBrbnegmA3VbHkQHfw+Pe9z?=
 =?us-ascii?Q?L+/zeMZvO9xRIHm5rwpNsNdba6KRwBLTFSsQrKg/gQUVcLEkHPQUo1EwDYnD?=
 =?us-ascii?Q?bGsH5HIq472iLX2OELihniulOUaZD0mY0Gz1B9AhkcK9QzmaGPjTbor67wpb?=
 =?us-ascii?Q?M883iSJzIx+qElzwsTTohq4oOvQPr4wMytw0Fd+Uu81KgnV239w7A2Aj43g7?=
 =?us-ascii?Q?tZLqS1U897YpAcU/Hp4Cv+ME+yljFBC1eMxjo4X6wuobYA+8RwnMcZNrfj82?=
 =?us-ascii?Q?X7R3dNhJWODCX1mRjuj1L5h0Mx3GpO5eh/GdNpzMKQisMdPsWPIlxEN9X9v6?=
 =?us-ascii?Q?9dliM7cGueFNX6EhcDJe1M76vjWoDQ9u7kvsk5V5043eJ2hTG0dieL2ANw7n?=
 =?us-ascii?Q?6k+K+yFrCiYi5Mezqp4l8HlcLeVuQw5bMI4khLcxyp+cCacmltJ8OEZHeUX1?=
 =?us-ascii?Q?npXipEx7mjkQPVCBp8im0Ydr+KNhVM7loCG7+kqfnAx7cP4TU0VjPf+dzZiF?=
 =?us-ascii?Q?m9PL6pYR4uQU3i1w3MsUXZ8Py3hqdXBD5KbEX0TMC9e7ePwrENu7Vdr7BFzQ?=
 =?us-ascii?Q?OEdGcsQRe0ECN4Ao15/4Bo/VHNPM48Da6H0rcSm/I50sKHL8zz2G8GhIb2xU?=
 =?us-ascii?Q?s4xHUIbEpZ0pLPv/UzPsx0qKxpxUbS8NrWFjSb/W+kOPjj0TWisbSE6JfIq4?=
 =?us-ascii?Q?T9Voqrh4hw=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 40565259-2b3a-4c68-cfe6-08de741ca066
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 03:19:03.3034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +e5HUHPLcvm62VY1n8W9dtVc0g83zLyotHnjJ3UMRiYYwJu0QSUWBxVjvoZwgpTO0gG+B5eEDvy+63AQpTqwvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5235
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6071-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-rtc];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,garyguo.net:mid,garyguo.net:dkim]
X-Rspamd-Queue-Id: E95C51912A3
X-Rspamd-Action: no action

On 2026-02-24 22:44, Alexandre Belloni wrote:
> On 24/02/2026 23:23:29+0100, Danilo Krummrich wrote:
>> On Tue Feb 24, 2026 at 6:28 PM CET, Alexandre Belloni wrote:
>> > On 24/02/2026 17:35:23+0100, Danilo Krummrich wrote:
>> >> (I did not have any specific hardware in mind when sketching this up (e.g. an
>> >> IRQ could also only be needed in bus device callbacks, e.g. for loading firmware
>> >> etc.). But for RTC it obviously is common that it is relevant to the class
>> >> device too.)
>> >> 
>> >> So, I assume you mean because there could already be an ioctl before the IRQ has
>> >> been successfully registered, and this ioctl may wait for an IRQ?
>> >> 
>> >> In this case the irq::Registration should go into rtc_data instead to account
>> >> for this dependency. Unfortunately, this is a semantic dependency that we can't
>> >> always catch at compile time.
>> >> 
>> >> The reason we sometimes can is because, if you would need access to the
>> >> irq::Registration from ioctls (e.g. for calling synchronize(), enable(),
>> >> disable() etc.) it would be caught, because you couldn't access it without it
>> >> being in rtc_data in the first place, and being forced to have it in rtc_data
>> >> guarantees that the ordering can't be wrong.
>> >
>> > No, once you register the rtc, the character device will appear in
>> > userspace and may be opened, at this point, probe is not allowed to fail
>> > anymore which you are allowing by trying to register the IRQ so late.
>> 
>> This does not seem to correspond to my previous reply -- may I kindly ask you to
>> read it again?
>> 
>> Here's also some sketched up code for what I wrote above:
>> 
>> 	fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinInit<Self, Error> {
>> 	    let dev = pdev.as_ref();
>> 
>> 	    let rtc_data = impl_pin_init!(SampleRtcData {
>> 	        io: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar0")?,
>> 	        hw_variant: VendorVariant::StV1,
>> 	        irq <- irq::Registration::new(...),
>> 	    });
>> 
>> 	    let rtc = rtc::Device::new(dev, rtc_data)?;
>> 
>> 	    rtc::Registration::register(rtc)?;
>> 
>> 	    Ok(Self { rtc })
>> 	}
>> 
>> Note that if any of the RTC callbacks would ever need to call irq.synchronize(),
>> irq.disable(), etc. the compiler would enforce correct ordering, as there would
>> not be any other possibility to put the irq::Registration other than into the
>> rtc_data that goes into rtc::Device::new().
> 
> Right but again, the issue is not about the irq or resource allocation
> ordering, it is about probe failing after the character device creation.
> 
>> 
>> Besides that, you above mentioned "probe is not allowed to fail anymore" after
>> the RTC device is registered and the corresponding character device becomes
>> visible to userspace.
>> 
>> While there most likely isn't any good reason for probe() to fail afterwards for
>> RTC devices, it is not the case that this isn't allowed. We generally can unwind
>> from a class device registration. In fact, this is not different to remove()
>> being called (immediately).
> 
> It is actually different, this was the race back then:
> 
> CPU0:                                CPU1:
> sys_load_module()
>  do_init_module()
>   do_one_initcall()
>    cmos_do_probe()
>     rtc_device_register()
>      __register_chrdev()
>      cdev->owner = struct module*
>                                      open("/dev/rtc0")
>     rtc_device_unregister()
>   module_put()
>   free_module()
>    module_free(mod->module_core)
>    /* struct module *module is now
>       freed */
>                                       chrdev_open()
>                                        spin_lock(cdev_lock)
>                                        cdev_get()
>                                         try_module_get()
>                                          module_is_live()
>                                          /* dereferences already
>                                             freed struct module* */
> 
> 
> I don't think it has been solved since then.

I think it is not realistic to require module init to always complete once a char
dev is registered. What if you're trying to register multiple char devs?

I think this requires that either `rtc_device_unregister` to wait until all
opened fds on the char dev to be closed before returning, or a reference
count to the module is kept. (Or having the file ops being swapped out so
further operation on the fd doesn't hit the module anymore).

Anyhow, this looks exactly what all the driver-core revocable discussion is about.

Best,
Gary

