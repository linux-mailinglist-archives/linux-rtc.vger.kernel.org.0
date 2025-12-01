Return-Path: <linux-rtc+bounces-5496-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D39C976F5
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Dec 2025 13:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EDB13A3C99
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Dec 2025 12:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4355830EF76;
	Mon,  1 Dec 2025 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="OxSiRyR0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022083.outbound.protection.outlook.com [52.101.66.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4171E30F553;
	Mon,  1 Dec 2025 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593449; cv=fail; b=boNIxmhpvo2RO+A/RNQjQXYhG0+mpgDFolzdk3T3xNsQRUdDfNbwod6I5dQRAa7qP2++kapmhgylVE+0DL5P+YyyZ6zCMpHDjB2XY6d22OBjWVs7sbWRVagZPBXpduF7U5RGPrg7aNhCUp7adfadCxn+QkKDAjZ9MgMom065vQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593449; c=relaxed/simple;
	bh=h9xGB/EyFz17szFo4wb6CcWHoPAalZLi69SCD8Gh94c=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=UCrVk/BOW9JZ1g0MjA7wt/4hB0L9uKu+nX0fAPIriG46MnDNVKV189BafaQbAbuqwM2BwiyiPWdnXZscQ8/zbMyM06+ypfYbWTT+oyRlNH6sg8b9WMDGGJG2fl9fpa2T9xaLLzdr3gmPG3QDGGEROjZOARNpxnneEjoYYgYlDKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=OxSiRyR0; arc=fail smtp.client-ip=52.101.66.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVgtSoNIAS6tQKayWjqeDKsLlq50BLqzC9GmdTobpiCuW89Jl+S6EIs2EyVnPk5IvcM79Cex6DnFDvt4o8HtHr0UOU7GKfkLsD+JQvYbHXKdL23UDbRPRR3EWIgZzOcGD7hgNekO6JUyLqTEd5euCgtWkHGl7QWuDjhDWpgs4glipkWV/I+kOTxZ2jSBounNU5j7BpVpSCZKRFqi0ku0WuguI6vfDYbCivmnPbuwB0jqlPBfkRAeGqAf2/hYAm4kLV8/RR23ukUz0G4LQVzfxDscpHSoh+h58sk6wRJ/+6IslE/5ASF+fpqCgHyhpfubmgAaqLrliCoBmFFBJ8BgJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B03uR0NLeToJ7OJxGE/5bcxntRjG0V627+2eT7gVdZM=;
 b=KGQUR1WaRfBfDNhw8pp+M9+WayLQDIqDm9v5hVBDw4Npibu0cxU8uy+2b6/fIQIPkriNvL+EggKtvONs0ZtgBfr+M1km4JZ5upFsh/gg4/5s27W1h8pfySsNn2U/FY6UWZF4LclaKzCeq2OW1yezZfUrI0so816ct2yxYQSrTQnBjz7/lPsj9K3sZMlmUngJUUkH7pcOFXYLVSsGCYk/VjkkrOq8/IpsYFP+UsIct+vVuAc1q8PoLXMkTMLSD9ROCobxJl56FFdGZFjOv/uDkkBP8joqEBq4A63gy4dB1Q7ayJKT0hTHvBKCHqNHyzswbaDTLahazj0E5ExyAEvrvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B03uR0NLeToJ7OJxGE/5bcxntRjG0V627+2eT7gVdZM=;
 b=OxSiRyR0Ow4xql7SzQkph1nrVSatq1M0CQ5qlhSN5JkRsPYEPAm8SZif5ZrXj0AaTtKXyMzBdrVkebGplct3vHuzZyhz6Du1GSde8cIKByUvNWmWaWb8fxmJWj5bD4rAAstRbwm/gcCpHNDoG6+QIkm5/hbbLUVWRbyEoKZU25P6eWt+9eeNNaY7S/pj2Z9/Svfladg2LiCOCE7pl0gYcmBRdBPqIESTL3y6zE/hYpxQXFO5gLOc0nNKWz2S7MoGmzKrh+A4Yl/VIALo9HU2kuw8BwpcE7xdpQwn2I0nJFkGfIwkGtGKnChAUBzAytwl3WNUh05fMZYrNheSEGmkaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by DU4PR06MB10410.eurprd06.prod.outlook.com (2603:10a6:10:61d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:50:41 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:50:41 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Subject: [PATCH 0/4] rtc: zynqmp: fixes for read and set offset
Date: Mon, 01 Dec 2025 12:50:25 +0000
Message-Id: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABGPLWkC/x3MOQ6AIBBA0auYqZ0EcCm8irFQGHUKEUGNS7i7x
 PIV/78QyDMFaLIXPJ0ceLUJMs9Az72dCNkkgxKqkkpIfG67LQ79rvFwpt8poFG1KOpSayEHSKH
 zNPL1T9suxg8BvQHIZAAAAA==
X-Change-ID: 20251201-zynqmp-rtc-updates-d260364cc01b
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593441; l=1227;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=h9xGB/EyFz17szFo4wb6CcWHoPAalZLi69SCD8Gh94c=;
 b=lhfHgZkmQfDqI5p3cb0rUMnQ5UcarFgyKKyMDmfElxpqyyAcJGNxH522K0PNH9P+B2O/BgXIO
 DRLPZXFP95yDB/cxUpNjDAfr7XOESUGnhlTO72A3GmWDRmtq2akybwh
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GVX0EPF0001A050.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::49f) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|DU4PR06MB10410:EE_
X-MS-Office365-Filtering-Correlation-Id: 054f4baa-c268-4799-73ac-08de30d83c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cG9DMXBMNGtuT0JFMStVczU5R0xmVGN3dHk5RUt1aEhndzQrSDJiNE8zVjZG?=
 =?utf-8?B?WTVRa0cvOWdxRTdTQXY5bWxrbSthRU4vYlFvcWpINVJkU1hoeGRSNmNlTkFa?=
 =?utf-8?B?SGY1eURYSk9KLzRoNVd5a0dDa3JwYUl5MzZtaHdaRUZyMVJaZDQrZEh1YTlv?=
 =?utf-8?B?TExaejRoN0RwUGFqNnZIMHZ2M0VnRFIvRy8xeFZCbkdDRmN6Yis1Zzhaenl3?=
 =?utf-8?B?VHVwSWZqUzRrSDdyQnhHSTVCbmRlRWo5ZlI5QzhIZFBnYjVUZHRQNFdWeSsx?=
 =?utf-8?B?dm52anFDSjRPcXN0RXdpMUNuc3l1SFlJOEsraHVITFgxL3dhMFRrQ0NzQjBH?=
 =?utf-8?B?KzczUzdPV2JyeFQ1TWw0R1AyMTVQeWh5OEtua0hGQ0U5bURyRElOa3MwWUZT?=
 =?utf-8?B?ZHg2RGl1bDhRVnJDUzUvVTVmMGsveFR5TjRZY2VHczFpV1lqMDAwWHA4dzhr?=
 =?utf-8?B?NmVnNlUxODYrL1ZIbkNjME1yYVJBbEd0YWF6RUxJWWw1Y092RW1DN0xBMmxL?=
 =?utf-8?B?ekx4WU5ZWGZSbjFkWThhWXF6MXcwR2p4c2tCRjJrUzErdk5ZSlI3VVlkTkxU?=
 =?utf-8?B?RTZxWW1wSC94YmlaRmQzZ2wySFc0VWY0eVBPQ1FMb1N6bjVqY2tEUDZ0MVpU?=
 =?utf-8?B?U3BlckZIWlpIa2xlQlFIdCtvVkVFbXpKR3hHMVZ6NXNVQ0M4WnVDbEtQMjc3?=
 =?utf-8?B?WHJtVGZSQStZSGhJOGJKQTAraDVHMFlDYWdveDArRDVxQkwycEkwVEJ5bFVp?=
 =?utf-8?B?U3dYd0cvVDcvcGZJeXJUQ2szQXNmSDN5OUltSjVTVm8yMDd6bWpFOW5GWnU4?=
 =?utf-8?B?bEpqcW1oZmdqeEF3ZjFDQ3RCb0J4OHlOVEZaQ3ZiUFJhTGVUMFdiQXhFcGVa?=
 =?utf-8?B?QjgrYkt0ZTFoZ3p5WHorR1prM0lKWDB4Z0hPbmt0T1lRL1ltQTlXVGd3bkNm?=
 =?utf-8?B?SitaYkpRMUtDT1Q0NVhrMnVYTkg3WEV4L1kvdGdXa25GMi9PY1UzTTBTNVJU?=
 =?utf-8?B?RDM4UUNzK3JJVmhSdXRwZEFyc04vUnh6Ni9BWm4xSmhDOGJZajEwK2FmTGRo?=
 =?utf-8?B?WHpZRWQ0T2Z5aVVSb0oyOC9kRUkwQjh2WmRpT2Z5cUFmYW80OVN5eE8xT0hs?=
 =?utf-8?B?U1JFMzhnMDRTNFUzWDFtc0VMRmZaYUdrWXQrdVRrbDdXdjU3dUVBb1Exbkgv?=
 =?utf-8?B?cjFvSG9CeFFOL2dURGZvcGIxRWF6bkNjRjg2MGIwK21LVU91dUdaMFNuZUpK?=
 =?utf-8?B?MW1tMCs0UGlxZUlsTmh2UCtnWndKekN6Ri9pREpOd0M3TFRBeER1aStub0lY?=
 =?utf-8?B?ZlBEU2dnbzIvYjRBWEV4WDFRSHZ5bHhYQm4wbS9Fbm9iS0JLVFhwY3hZcnlq?=
 =?utf-8?B?dFhWMmpabzBhWTdpVTF0T1J6SHV1a1Rrbm9WVTZ0U2RRcWR1dVB2S2lkVzIx?=
 =?utf-8?B?UXl0ajdWSlFqRU55aDBQeFV6aFlnamZ6SUpFU1VTbklqNHJmWllDaWlJaDVX?=
 =?utf-8?B?d3l3blBKS0JMWm9YOE1iM3pYWXV2Z1Q3cVF0bTQ4bUtLTXU1enAvNmpQb2lC?=
 =?utf-8?B?Mm5XRlV4WlpocXVxMHpDRlMvU2VUTkZQZnVyM1VYUDhjZDlqZmpMRS93aHlj?=
 =?utf-8?B?N2ZEekZkSjZCSHBGU1VuVlY1dXJoQXE2RkRMWm1HODJCYm80L3V4bTloKytm?=
 =?utf-8?B?dm5FaU9rUEFWcHdEQTgxRXhyMGVad29HVzBDb1JMRDJHT0RsYTBVZ3ZJMlhx?=
 =?utf-8?B?M0pyRmJNOUttNi9NdFNKbkJOZWlhS2luUWdIbUtRcGY3dkVadGlvOVV5b0k1?=
 =?utf-8?B?WUdrcVFIRlN1bXMrclJRTFBDOXgwVzRBOWZLZ3hyODVwdklnajFndVd1QnFT?=
 =?utf-8?B?c2E3VHgrM3NrdHFiRitRc2NoWk5SUXlzR2tuc2h4am1wN0JPbmk1cVVXazhE?=
 =?utf-8?B?dEI1azVMblFuZkhsQUJoZW5BZXhxTzE2SU9uK1lkTGQ4OWFvUWdFVllQQzkw?=
 =?utf-8?B?aFQ0bG8rdTl2bjFJd2ZoYTVVWWJVRWxGdUhNT2EwSEl0Z2grd3dDVHBZcXFo?=
 =?utf-8?Q?5fLdyt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1U1czlsTWt1QWZuc25FaVArZUxhWTRhTndPbUtQb0VKVVg0SVdacVRiT05E?=
 =?utf-8?B?enhmdm5nL3hDYWNORUVXVGtleFVja2lWNjZocVRpZGZ2dUxQOE5BZzRZZzdI?=
 =?utf-8?B?T0FYZHcxYTc1WkNZSUJWSGhRVlpQT0s2aDRBUHJGSGJ5S1FIM3M3ZmwvY0U0?=
 =?utf-8?B?YnJweTNkYm1aN1BqM2k4V2o3RVBuZVUrNysyTkIvZDNBanNQVVJYb2hZTThz?=
 =?utf-8?B?Z2k3Z2JxckRMTFlyTGpBem1pZ1hlWEk4NEZaM3FnVFZOcnBRdVcvSmhkVWJ1?=
 =?utf-8?B?c2JCbnRMUkxJWWdHUktxQm1xODJPV1hWMWt2K1ZaTUVEOUY1K0VzZUwvSHd4?=
 =?utf-8?B?cFlXTVMwZDlJKytyb3ZzeXhnZkhHSTB5N0YwZDB3aWJuQU4rTy94YlpDS1Fl?=
 =?utf-8?B?ZzhnY3h1cGVRT1BidzlHNDBsS1FsWW1hclpDMjNrTUUzZkp4OWppZ1BrUG02?=
 =?utf-8?B?Y1VqMk42ZWNubVRUQkRCT1dxSldOY2ZpT0ptK0hRQUxkcTN3L0dXODgrbVpL?=
 =?utf-8?B?emUzTEZIVisyVUxDa1BSamljQ3VvRkdXTnQwbk1XdFROcDEwU01JS1liaHI3?=
 =?utf-8?B?QzVJL2F2b09wK1Fzdko0VFFsZXFlYldOMzJLMHlBdkF0N0ltaFVEcGlvRnlV?=
 =?utf-8?B?NGhmRklLc25hRkZkVWJ5bk9nODJ4ZCt3UjNpVGw5NUxkUnFGdWVVUlVZWldT?=
 =?utf-8?B?WVJVRGZxbFhldGFXd1lEbXlvUUpMenlxK1ZmSmtYRTBYcWV5Skp2VjJVL2s4?=
 =?utf-8?B?U3BFZG9HbndRYmZNellIQ3NvVFIwMlo5dXE4YkJ4Wjk5Y2RtK0tYSWhkYnZY?=
 =?utf-8?B?YUtmR3dKRE5vMmt0cXZGL3hsYXh0KzFJaGw1cEk0RnJNK2RKUlhSZC80emhK?=
 =?utf-8?B?eEh1MUlvUVQ4ZldUb3c1WmFvWjAzTndVMkdyVXVHeXgzL2NZL09vdnk0anpi?=
 =?utf-8?B?Y2NCdlZSSkxub2UydzZxZTI0RUowSnl1K09kVUN1cXdtWlY3T3JlaHg3Ukp1?=
 =?utf-8?B?UXJ1UGgzZ0JhcEFBdE9yOGJTL0lEeFJYWlJDdUNlaXZWL3JlVmlFbnU4WU9a?=
 =?utf-8?B?V0FITTdMcjRYYjg4NVRqZTZrREFsRWVFbjl0NlZpY3VVSUdnYUNNci9ORHA2?=
 =?utf-8?B?NVcyZEpSbDFtMHNZOHF2dGtlSGx4bkhtZzd1ZEwrTktLSlhJbmw3blB1dG5Z?=
 =?utf-8?B?OCtnS2huKzlxclVrV3lIcVNjbFEwSmNBY3VFRmVPOHB0VFRxd1FCcGUySzlS?=
 =?utf-8?B?ZlJoVmRYV3ltamdoVnVxZTdaU2luTHF4eWQzYUhrYUs1YkNHdFZoRU5reG54?=
 =?utf-8?B?S1JqdDloemdKd3lnNklBb1RHT2RSRnFHanhDV293Vm1mV2lGWmYvR0orUmlq?=
 =?utf-8?B?WEJnbWlUSUpFaDN4SFl4Tm1HWkVOUnlPc04zbWc0VFBhRTFVbkZYQXBSYXdv?=
 =?utf-8?B?TkRodkFnVFlGcklRemVnYWJpTnh2VldTdG5LK2FCNkV3RVBmV1NGdTF5MnIy?=
 =?utf-8?B?bzNvTm4zUFUzUUtKZDU0ODFVUm1MRzl6YlhPMW40cElVdTIxaldTQzljeC9V?=
 =?utf-8?B?elpaN0pybGgxSnNQNnN2blUySDgwVC9hbGE5UDdONTA1ZXNhY0FBK0tIWE1X?=
 =?utf-8?B?WXBkNzdkUWJWbVc1QjZxVE9VL0UvY2IvZEI1dGVvRjNuWkdoQmxBaUR3dW11?=
 =?utf-8?B?dE9ZZ2RJNGdjMTZjVDNUQVRqYUQvUmp5TVZ0NktTYkVBano0MVZNWlh5YitZ?=
 =?utf-8?B?d3NnWVRkdzlLYU0wOFVaMDdLMmpRcHdyQzAxcVVxZWNwMFBxV2R3NmVnQ0pz?=
 =?utf-8?B?SFY4c1ZXdjJybS8xTDgreDVNSGNrdkl4akxTWlFKZzhEL2FkN3JYS2EyNzZY?=
 =?utf-8?B?TlZuaGNNTExNZEUrQ3FyMG03Smk0V2JqZzU1K0ttL1dSZlZkaFNSNUx6SERj?=
 =?utf-8?B?eXNFdW9mK0JjaUlEV3d3Z3dJN2gxTEVpU1hvSHRQUitndW15SW4vUEdVaEZh?=
 =?utf-8?B?bThpYzFNczE2K1BRMklUQ24xSUYxN1p4ZGF4cEdkR042UkdYNGp2K2dVanN5?=
 =?utf-8?B?OEcyeE1rQjR2eHZiVHZFNmRSb251ZlVtallPN0dGaFlwZEhRN09UcHI2cmhR?=
 =?utf-8?B?bFV4RTVCVVAwTjNlckh2NHJRc1ZWZC9ici9xK04rZjNOZVh4UG5IMFRlRUlP?=
 =?utf-8?B?bnc9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 054f4baa-c268-4799-73ac-08de30d83c3b
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:50:41.5430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXe8tGiRZ1fBdFHKApQlTCBsWnQEEpxihS4Q3J5Pd3K6GYDKpUP4yUSkPlGEgAQyjkPznAGQzWyLynlsFUB0Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB10410

Add improvements for read and set offset functions.
The basic functionality is still the same, but offset correction values
are now updated to match with expected.

The RTC calibration value operates with full ticks,
and fractional ticks which are a 1/16 of a full tick.
The 16 lowest bits in the calibration registers are for the full ticks
and value matches the external oscillator in Hz. Through that,
the maximum and minimum offset values can be calculated dynamically,
as they depend on the input frequency used.

For docs on the calibration register, see
https://docs.amd.com/r/en-US/ug1087-zynq-ultrascale-registers/CALIB_READ-RTC-Register

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
Tomas Melin (4):
      rtc: zynqmp: correct frequency value
      rtc: zynqmp: rework read_offset
      rtc: zynqmp: rework set_offset
      rtc: zynqmp: use dynamic max and min offset ranges

 drivers/rtc/rtc-zynqmp.c | 65 ++++++++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 32 deletions(-)
---
base-commit: cd635e33b0113287c94021be53d2a7c61a1614e9
change-id: 20251201-zynqmp-rtc-updates-d260364cc01b

Best regards,
-- 
Tomas Melin <tomas.melin@vaisala.com>


