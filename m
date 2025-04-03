Return-Path: <linux-rtc+bounces-3763-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA922A7A116
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 12:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EC333B5FF0
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 10:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4DF24C074;
	Thu,  3 Apr 2025 10:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tDdShcOK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2050.outbound.protection.outlook.com [40.107.249.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CD324BC15;
	Thu,  3 Apr 2025 10:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743676450; cv=fail; b=dYtwUpAXy9558skVLFS3C/6HW5E3qzgThuC/lY5yQ0/8vHnN4x5tvTEO6lNaotAy/cf9ZOIrQZAD8YJmRaCQyPXjM9RWYsj3rSRk40xKysNa3A8/kFK9xWpdeM1BrTXjLOJz5LMMnmb7aq6xIcnd4mV+/DUDRcyXbkD5uBQ9XrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743676450; c=relaxed/simple;
	bh=Un1hRl81HEY+vx4N8cc2Qmk7RcvOborFXX0rp13eZiU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LaCjztOL03MK/YIkt4LB1+WxsNhbXJUEBfMBSkrITqsGwpMsay8FwewJn2fNrSBXuW3L/8MSWybpqi1bm3jVQ6x9Zy72n/gtqO0yWOlNCrU7VutuE+t/eVjPrzLbbRljghg1PuN1Ug7jp4ojBbk6jPODp6oNNT1PK80hLMpQkb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tDdShcOK; arc=fail smtp.client-ip=40.107.249.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQMYdiZtWS2Y3cry6yHs8bQIJbmjkbt9Fn/TY6i9H2KCP4X/3cK8lMnDe3mU4v9MdkfQwYBFWpyridJdVT/Ja0Mb4L/nWpWh3BZfMFlSozO1OwAOorhvvONvt0IjnLnYS/nQ6JyEyZWSPMlzJZK4lZOvqEOCTO2AzUcq2uFxCYFhrmtV1Z9w7JvXkXynT6SZgkYJacDq6jdRpn/h61/HBDfpYJtZgk+wQv2ql3yaxV9aGuQ43A1iRb+iclDkmmZ8272Bv9eIZbiEiVyAfx9LIrXJ0uah0CfAuJbiF1cvF4B1jhacSaPGI1OQlmos7J2zcRYPcH9GfJi4mTXZwEEgUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wb2PPo9XPAHC2Pfd7LSz/mgWsohhrpaxob1iEv+pfHY=;
 b=CxN7FRMfwpRHrnIsFEqPR3ekJf3O1s7vE0FoleddAC+v5/4QXeaQeN8uXU7m/grjAq6xOFOKQxAlR6ntn58WIjoRVaC4c0aZK9oS0AmlCN0FXuMTVl6bWPx0Ei0QIGDP5l5gAL5kZdhmuFKkt+IwpDYhblRS6qlZQABDoWdCbcz0syEEgZin5P6EpFw+PmbwzJcXyKJKXGBM7DxpUEC0MLTHCuwMS9Fgap79uZnHiPuuGWqyb3OXtaWXcQ+L09EhfnAqll4V4ZMBqQ3TOyzWO6vhh5T/NQw0bRyd+HWzJzHbAnz8V70SEvT0LVtqvNP9mmFMbbuMXywrZARI3ak99g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb2PPo9XPAHC2Pfd7LSz/mgWsohhrpaxob1iEv+pfHY=;
 b=tDdShcOK7uEHEPgIq/PuT7zE2XDrAKkobwO1hHnIu4l3BZq2bdToiKMhm/YZTAi6vlF89c6vhyDQJT1ecOiwja0bOmlmR2Lht1aIankIR6nsdkkFAetgWIkBMHolHbS9ncr4e7uGcXMz93WiW2l2DxmltqQMFXFZJ3lM2WDQIj7l1C6NLS2Jm5kB8hhV70e4hTtFwv6011+8dRVOLHE18s/MU7871LSA2FtVRUMBf67SACPYik3zGIsBctizh5dKB5U4EHB4mYpOQERUIh4N2kXAIAyg4b1nWgkO2MfR4AhrCUlD9MsveszW9rwkspwQf6TbbghXxPB4kJUsyjvhxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Thu, 3 Apr
 2025 10:33:56 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 10:33:50 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v9 0/4] add NXP RTC driver support for S32G2/S32G3 SoCs
Date: Thu,  3 Apr 2025 13:33:42 +0300
Message-ID: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::17) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VE1PR04MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: ba63d7d3-26ba-47d0-0d9f-08dd729b0610
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1lWaUF5M2RwOTY2bmpsWVVrQ2o1TFI0ZTBUblMwYTFQbWNuYTBJby9Rd0Uw?=
 =?utf-8?B?OUhDMXBGZTgzT2xkY2RWOWVlME5ucUhkTEUzYkFpNTN4VTlZMU5DaEp6RE9m?=
 =?utf-8?B?WTdudk5mK0lpeXZsNWluREEzUXlQV0UxY0d3LzF6TEhWWVVGc3NjZXNFUzV6?=
 =?utf-8?B?Wllpbk5rY3RYM1JuMkloZkVoL0FueVFNL3p0YlhaTVhHVEdWL0U3Zno1RTBt?=
 =?utf-8?B?dE5WZUJKWjdDdFB4K0ZqMmduWDZ1bkFjVUNxNEJHWFpaVFdFdUtEeWpoa0U0?=
 =?utf-8?B?VmoyTW5HMytlaW5OcEhpNTk1V2Qya1ZnVlBTSmxrMStRR280bW94T2xIWS9W?=
 =?utf-8?B?cE53UDJzVjVJVWFrNGNNbU4vTm9uY09NTGh5OUduU09xZEMxLzkxeml3WUNO?=
 =?utf-8?B?Q3pEaVhJckl1TDF4TlU0UUx6SUFQVnJLVmpPUVh4Y3o2amc0U0pQenVqZm81?=
 =?utf-8?B?b3B4MDBFZW5UbWJhdEc1Z2xLdFNsTnZuc2ZoUUNUQXEvMUZwL1NaQUY1a09W?=
 =?utf-8?B?Y3IvVlhLa0tEUUdyWjNib1gyREV6czhaU3dKNlVmTVpvWGdpR2piOXIwK3Jw?=
 =?utf-8?B?aHdSeXdudlRVQUZyV0JMUjNDRzFycXJvUk1DZjBlcmg4eVdhMXdPcnNaSFpB?=
 =?utf-8?B?RE5mRy9yT1FmbjlEY2t2RmhYR1JFMEZabEs0a2plOEpXdnpIMm9OU1lXYW5N?=
 =?utf-8?B?c0FIblFTK2F4UlV4eWJIMlozcE0xSmw0ekRQbktiYlhBdFJkWUJqaGp2N012?=
 =?utf-8?B?NW1KRDhXMzZlMWV1YmhSaFdkM2t0YmN3YThJcysrUFR4SUhRSVRLZys1WGtH?=
 =?utf-8?B?SlB3WVZnWjFEeG42OUYvdXYwbVRleXRJS2dYdm5ac3RaVUxSNWZZM3ZuaHVt?=
 =?utf-8?B?TC9KU0ZEVzFPeW13YlNzL2JheGNUV0U4L1J4djFBUUtJcVcrem8rUW1ZV0Qx?=
 =?utf-8?B?RGxTSi8zTGxuU0lhM0RrZjBzRUUrVkkxS3IwVFJReTV1b1N6YVlaL3k1c0pX?=
 =?utf-8?B?YnlpZjR2U3hXSDhqUU9nUVJpNnBGOStXZ1FxOWJobDYwVUxkMW5mNkxteU4y?=
 =?utf-8?B?U0JEOWhiVXJrSTc2a3AyS3FielcrZ0VJdktJR3JLTS9lNkxLMHluc1VFN0N2?=
 =?utf-8?B?dWk1NGNPOE84cHpNUkNHc2QrZEdNZmhIZmdVTk5uN3pKTUxtdGFpM2RwSmpI?=
 =?utf-8?B?WUFKb1VSSHFWUHBkNi8rUS9kSDBKVThhY3FuTVBreUtZZFBxM0F5MW5iZGFS?=
 =?utf-8?B?d0dOV3NjcnlCeVpINGRtUnZmUUJJeEUyenUyWWliWDRlaFVoQWlhd3loWUho?=
 =?utf-8?B?OHJwVFJ1YlBBMXNZbWlwb3Y2enpVTDNXaXJLRC81N2xEN3JiSG9ZMzYwZTZQ?=
 =?utf-8?B?MXVUNGhsSGkxRUdXNmgyMGhuZDFrLzY5WVJUZVl4czcybkZsVUxncnJrNGNP?=
 =?utf-8?B?Y1hOZVY3bm1QWENaMDVlbzl5VnNBdmcxcmw4TzkwSThuT1pEa0dNODJYZGdp?=
 =?utf-8?B?cFVHK3FVVS8zbnhjMXhBNjFzdllGOWFvKzJWZFlxUXVlb0Z3UmxHTEFpWW8r?=
 =?utf-8?B?ckhWMktPcDF3WVZqbFZSQzF1UXhkbFdiejJEUkZwanlHVHNGZ21QN09pODQ1?=
 =?utf-8?B?WHpuMXpGMnJaU1JtZEtlUUVSUXpMb3lUaXVrWkVzTlJtR1hjUDlJenlSZ0Ft?=
 =?utf-8?B?VE03TGFtNmRYQ25YMUdHM3QvUUNYaWh3UkxZTmtXa0pFbG9YNlZOSGhweHdJ?=
 =?utf-8?B?MGlJQ1IwVTNtNnRUb0VaZEhxdHBGNTlaMGl1am0wclBKL25jV3ArZmJmNVRY?=
 =?utf-8?B?eEd3WTlNQ1R5amY4QUNUQWNmRkJSVmlaWUJDVDVKaHFQYm5LNWpPai8va1Na?=
 =?utf-8?B?SkFIR1k0ME0zcEo0TGdwRkZOREwwTVF1ZXM4ZUN1bGY4NjlYLzVGUjNab2Rv?=
 =?utf-8?Q?PIyW1x1Jymw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXc3VDJ4TmxuYVE5SDVMc3ZWdEV2ME1IcWZjeU9MNFF4RUE2U1FjdW8wWTha?=
 =?utf-8?B?NW9tMldYeVl5NUFFR20rVXdoMUtlSXkzeHE5djFrTDlPUy8xME8ranhvUFVY?=
 =?utf-8?B?Q1c1K2lSSEszbjZOMitLQnhPMmQ5K3ltVDhaMHhjWi9CQVFRRkFDT0o3L29Z?=
 =?utf-8?B?ZlIzKzJOSGVZcnJFeXErQk1Nb0RDWE5YZ0JUb3crNG1JZHJqNTNwUXd4LzRq?=
 =?utf-8?B?MEcwNkt2OWJIWmhzSkNsamZVRWQ1MjFiNzlmbzNiY1c3bmNtWUtFZ0hocWtR?=
 =?utf-8?B?TUFqanpiaktrOUJWbnd3NWE4Q0RmRTk5VjdhOXBHamlFK3FHeDV4YzVSeVIz?=
 =?utf-8?B?Z2pOa3J5TXBhamtSanRSTmwxUzF1eHczR09taEllcWRwSmxjWU5VS0ptcjRm?=
 =?utf-8?B?clZQOFo2OXBGOHlFQUw0cUQrSHRhN1Fzb2NUM1NjZGkyNkV3OW8zTlB2eUlh?=
 =?utf-8?B?ei9DN0NacXZadFdKekpXOFBZSDJoV01xVTNGQ2YvR3JBdXJlT2JXUVk4YS9u?=
 =?utf-8?B?NjN4VFc0YUVsZHhzNE1rcG41dldnNkI4RmFQL21vaDdxR2ZSWEFRU3VBZTBR?=
 =?utf-8?B?bFZsaWpEdE90SWJTYlhvUThIVjJQakFzcTRHSnJaZ0RNdVNXajd6OEI2aFI4?=
 =?utf-8?B?T2hIWk4rdUtXVVBRQ2dSK0ZmL2dPaVJ3WTBwV05KeGdDMnZpMmtSZ2t4cnhv?=
 =?utf-8?B?d1hTV3czbTdqaStKRlhSWmFFdXNpSkNLN00rcjZTT3ZpaWpudUowSUVLV2hr?=
 =?utf-8?B?VU5GaFNhRnRrWGxGVGFKallkZFFrRnhRSmJPMGFna0c0Q0xDbkVVVzdIWThq?=
 =?utf-8?B?c2U3anMwOTFyS3FrWGtLWUJLYWsvN3c2WUZiOVVBYXAyb0k2akZ2ejJSTXAx?=
 =?utf-8?B?R0sxWWlHMW4yUFA0SkJvYkM3SlU3RmUrUnB2dVZtUXFQNXk1dStEc3dhdVlI?=
 =?utf-8?B?UjNZSGdoOHhxZ1NHRnZjQXJZRTRlcXRJczJKMnZaMDlCT1lDelBnejNNZWFR?=
 =?utf-8?B?VE45ZXh1UmlNZnY4NnZCck14bktBVmR0TjRkZlJ3eUJVMFR1OXVIL0dUNU0v?=
 =?utf-8?B?NW5BUzFBTGE1RGJybG11c0xobU9UcWNYT21VemtHOW1TZ3B0eWlaUXVFYmYr?=
 =?utf-8?B?YWg2d3B5eEczT056MkNqZUJxSHMvWGpobFZpaXcxbXNqYjk4ek5xMkdXc2tK?=
 =?utf-8?B?QU1rT0JGL2Y4U3lyMUZicFhwUlR2MDZWWXoyUm9KOUFjb0I0U1RzdjIrNzVh?=
 =?utf-8?B?OXVVcGNoNUF4cjgyYitEMXdTY0JrT241ditCeVBBeDZDR1ZQVDNLZy9QaHJC?=
 =?utf-8?B?cVpudkplWnlHaXlsVGEreFNCOW5lN3hQamlsbDFiN0tvOFREOVlyMFE5Tk5I?=
 =?utf-8?B?U0xrYkJpQmdWUXVZSjFId1Z3UzJnSlFBdmUvS0ErSUhwR1hsaWpvL0tWLytm?=
 =?utf-8?B?ZjV3TFNTTFM2UVB2ZXhuKzhyUjNOMFY4NmRNaWxqazVyaWRkd3prSG1Cd3gy?=
 =?utf-8?B?Z1h2NDNsRnQ2ZVRrZnlCWWRrU1BUY2RUUUJKc3k4V1d2TUJCeVoxckFYWFhv?=
 =?utf-8?B?d0NjL2UvUjR6c2JOVlhCbDJhbDZrYTdia1VJVXc3R203TFBSd0JEZE1xZGxJ?=
 =?utf-8?B?TzZNK1pGRW54MjhCMGs5TGJmNXBxYWtxSGZ6Rk1YczF1V2FkRHVZSXl3Y0lr?=
 =?utf-8?B?M21rNXlubU5NcENmdzBLcWJnTzIrcitWWk9NOVZuYVRwc3NLYWNFRytlYXkr?=
 =?utf-8?B?YlduUTlLM1FnQlZ4MmhkRUZDRko3NFBLalExRlUwaVhVeVFwQ251WjBraUw4?=
 =?utf-8?B?LzhjZmVhc1BuN1dBbXVyWEREMys3a2dSS0pobE96c0lnV3pGczZncjkzaXpR?=
 =?utf-8?B?OU04N1FGRVVBOEY1eTdSRzRwb1pUbDRUR0RrdUhrU0QrZGlTNUQ4dDlpMlBP?=
 =?utf-8?B?WjRTS3lZL0FhdFE3YWkzUHhRVE5mL2YxWHM3bTBsS2ZIcFBSbEdoOE4vYjJu?=
 =?utf-8?B?VXFQZ24zYnRUZGZnNDk3cWRORUhleUd5Z2loVXAyc1hGLzBabmRycy9zdVVt?=
 =?utf-8?B?UEFzTlpSRUx0Y1paRFVzMldrcnV3SS8xVHRwSW1OUjJQcE02VHo2Z0RBenRm?=
 =?utf-8?B?K2FPR1cyTmUxMzJoYkFwQk1lUGV6K2VBQ25JUW9MRW5mUzBsb1RwWCtMczhl?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba63d7d3-26ba-47d0-0d9f-08dd729b0610
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 10:33:50.5155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KD151VyplnUoAYLlzICxlmgPLgifvqIDXZzB3x7y68jhbMwmkGNquuyOlE518zSoueUEfwqXj2amFnN3tv39ey53cTTR/xhWMZD7MlvXXuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7216

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patch series add support for the NXP RTC hardware module present on
S32G2/S32G3 SoCs.

RTC tracks clock time during system suspend. It is used as a time-based
wakeup source for the S32G2/S32G3 SoCs.

RTC is not battery-powered and it is not kept alive during system reset.

Following is an example of Suspend to RAM trigger on S32G2/S32G3 SoCs,
using userspace tools such as rtcwake:
# rtcwake -s 120 -m mem
# rtcwake: assuming RTC uses UTC ...
# rtcwake: wakeup from "mem" using /dev/rtc0 at Wed Feb  6 06:28:36 2036
#

Changes in V9:
- Added missing 'bitfield.h' include file
- Moved reserved clk mask check earlier to stop execution in case a
reserved clk is being used.
- Used 'DIV_ROUND_UP' macro when determining the rtc clock frequency.
- Fixed some indentation inconsistencies.
- Added Frank Li's Reviewed-by tag.

Changes in V8:
- Added description of uncommon S32G RTC hardware behaviour on resume.

Changes in V7:
- Changed 'ioread32/iowrite32' calls to more common 'readl/writel'.
- Removed calculations performed in 'suspend' and 'resume' routines by
  using RTC API ('APIVAL') functionality instead of relying on setting
  'RTCVAL'.
- Simplified 'set_alarm' and 'read_time/read_alarm' by usage of
  RTC APIVAL functionality and relying on kernel system time.
- Added comment about the available RTC hardware frequency divisors in the
  RTC driver.
- Used both available frequency divisors to increase the RTC rollover
  time.
- Removed a redundant error check on 'priv->irq'.

Changes in V6:
- Fixed a coding style issue regarding kernel doc reported by kernel test robot
- Refactored small sections from the S32G RTC driver without impacting
  functionality
- Fixed an error probe path issue on S32G RTC driver.
- Added 'rtc' schema in S32G-RTC bindings

Changes in V5:
- Removed rollover support.
- Removed clock switching support between Runtime and Suspend. A clock source
  which is always available has been used instead.
- Enabled 512 value RTC hardware frequency divisor to achieve higher rollover
  time
- Removed unneeded 'remove' callback.
- Decreased driver print verbosity on error paths.
- Provided 'clock-names' actual names in bindings documentation
- Remove __maybe_unused notations. Used the DEFINE_SIMPLE_DEV_PM_OPS() and
  pm_sleep_ptr() macros to handle the .suspend/.resume callbacks.
- Fixed some alignment issues.

Changes in V4:
- Dropped 'assigned-*' clock management approach. Simplified RTC Runtime
  and Suspend/Standby clock configuration.
- Simplified error paths on probe function
- Removed node label from bindings example
- Several cosmetic coding style fixes

Changes in V3:
- Removed 'nxp,s32g3-rtc' compatible string
- Change to 'remove' callback from 'remove_new'
- Used 'dev.parent' from 'struct rtc_device' instead of defining a
  specific 'struct device' in driver data
- Fixed several errors reported by kernel test robot
- Removed 'assigned-clocks', 'assigned-clock-parents' and
  'assigned-clock-rates' from required properties in the binding
  documentation.
- Refactored S32G RTC driver such that a default clock source and
  divisors configuration will be applied in case 'assigned-clocks' and
  'assigned-clock-parents' properties are missing.

Changes in V2:
- Removed 'clksel' support from dts bindings. Used clock parents support
  from CCF to better illustrate the RTC hardware IP from S32G2/S32G3.
- Removed frequency dividers support from dts bindings. Used assigned
  clock frequencies support from CCF instead.
- Reduced the interval while RTC is voluntarily disabled to a simple
  register write in order to avoid any race condition between a possbile
  rollover and 'suspend' callback execution flow.
- Updated bindings documentation with respect to clocking support.
- Fixed a potential unused variable warning reported by kernel test robot.
- Updated to usage of 'devm_rtc_allocate_device' and 'devm_rtc_register_device'
  instead of deprecated 'devm_rtc_device_register'.

Ciprian Marian Costea (4):
  dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
  rtc: s32g: add NXP S32G2/S32G3 SoC support
  arm64: defconfig: add S32G RTC module support
  MAINTAINERS: add NXP S32G RTC driver

 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml |  72 ++++
 MAINTAINERS                                   |   2 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-s32g.c                        | 385 ++++++++++++++++++
 6 files changed, 472 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 create mode 100644 drivers/rtc/rtc-s32g.c

-- 
2.45.2


