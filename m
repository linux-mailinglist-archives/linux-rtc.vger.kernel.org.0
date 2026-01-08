Return-Path: <linux-rtc+bounces-5692-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47618D049F9
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 18:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5F6632C5B9E
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 15:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C951F39E167;
	Thu,  8 Jan 2026 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="1OVAeVmk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020078.outbound.protection.outlook.com [52.101.84.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90992466B75;
	Thu,  8 Jan 2026 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876694; cv=fail; b=N+4CbNkhQDeGeyyOP+hIVOYMgUf9HY/UChaztlr5gHmucFXdqpTDdhxYQeSPcmMhjDnN7OiDeGgxQ1027CMtBxdF1XqNvSWnxeBz6KEMt3hZyEncW3l1kZuZRmNGwHjuLK9w5AXMN1YsCBCGk9s6/UwoMNlar8OydGxam6zG2wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876694; c=relaxed/simple;
	bh=SlX0LUS7X+e+qywKmoZa6+qN794xbwQbNPPofmd9TkY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=S+nFuiSy0Ev2RqHXbjXnP/cYqTLNSV1TVPpQRuhNInqaeIDD5MZhjYNT/MfpiOvy0fAAYHYsJa6qH/C03Gz4zFoZIoREE6GzZbRR/Bc2IkzABgviFrjCW32n/xPmR30jKn1qz7GtKxcK4nWqHeOTmqX//V7xLlSmt5OkVRSBK6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=1OVAeVmk; arc=fail smtp.client-ip=52.101.84.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vvm6eYLwQU00s4qCCk0uQykDRk4/DCOzmuhuecUNM3xAsq5P0CiW6hmS45v8wFPyc22TfSszp91j5QYMALV3/zmk9KvsHVApDEEcVU+Pq57YIiYClBw3MUTCknverOgE1wrZ1aSAEZu1+SguwrIV8rIitA7DPvVbZUfomIM/d37tLuTaMyaLbMY4FjDwWCrePI143GwkotokV0zeyzt2vz0wYMbWXf3H3/6Z7mlp4YfhXPZeqgjM8ofb6993ANRs9AfbU473IG2EuxlBLWjYb2FttXAWANhXZ8drgPTpv+aYiMjXlgQgjpZS74Jgt1CBnBLTYHAnhD1dHbNSxjuZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBieBRFsks1KYdDmdOSUEoHlLj/OucDHaTZOqz9wS/M=;
 b=PlUNFl6l9neTGIsJdQbbF1OYVg/BDohKdCufyWIdI64uNahPuuH7VVgKviWdAhoJler1++2mdhLMTR+1QXnmEx6FstB/QduQp8CTMOBTCJtZf6SCOTnVJakGuyAK2M63aTC1AnAEiyvABWdbg20HnIte6hgP02czQqFEASiRYm4HlI4Gl9fNZFSdeSCaw3HccRXEoZfEBr8KOBwL6IAHa+CiwwKHeVhUDeB4fbAm9bosXI9tHtCLT/zcwsj4Od8hhXvzL+H46iljKzbAgsXH8cziJsULx1kIBcuZGnIpyR48hsGyvpGPGG9jhVcYvDUM5k1Q+e8IvcQORXH5B6kU6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBieBRFsks1KYdDmdOSUEoHlLj/OucDHaTZOqz9wS/M=;
 b=1OVAeVmkSzMiUM5o2DC81Ax8dk7gx0Vp029rlpcnwdl4flW/7LrRmI9CMF2n0cCesRqL7vESZ+oUWPYHgw3+Bz1ZKRVN0Ug1ziZc+2jdJ/UOuVxdC8svpZ2XTeBGIpX1yIOslb7jgl2KpRqk4C38rgpTj6S0vRaVMqSwKScRGOEvpt3Hgx7ijVtiDzO4gbk+fODx7ggvfH3vK4oF8Xv5Orc/PiTR4nqubEC6HN8A7v6tn7FpUJv7z6a55FQFGlOyR1BauICNvTE4JFs2hNjYx4It0OEQxRAB8W7V5Abk/cGA321YIaEhiJJ7AahUV3o66ca/x3xQ9uupFTBcIpcetQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by PAXPR06MB7456.eurprd06.prod.outlook.com (2603:10a6:102:151::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 12:51:27 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 12:51:27 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Thu, 08 Jan 2026 12:51:13 +0000
Subject: [PATCH v2 2/5] rtc: zynqmp: check calibration max value
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-zynqmp-rtc-updates-v2-2-864c161fa83d@vaisala.com>
References: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
In-Reply-To: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767876686; l=795;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=SlX0LUS7X+e+qywKmoZa6+qN794xbwQbNPPofmd9TkY=;
 b=H9jaa8p09i2HFVEDqhW9G2XcoQU60atygXmaaK3K6yjPs/tN5WE2OfpxcjMBL7VDWrujMbaDe
 VnfDSGGRjQhDs4mewAEXGama3AthwCHWQeLIgvMQeMSjfy09yQdjEZ4
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF00007567.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3e5) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|PAXPR06MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: bd69f1d0-c134-4ef7-25fc-08de4eb4a361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0tFUGZaRGpxemxVTTR1VFVGdHJmWWw4R3d1bzRadUhuM0xmNCt5Sm5jZEpo?=
 =?utf-8?B?d3h2T0VkbHVqejh1Q25WQzF5Wm1hcTcxdzRPSnZuVksramk0OW1LR1V3Ui9I?=
 =?utf-8?B?RmpLWlZIeHJmUXRqNnVDT1VZNi9wUTBHU1BLQW5zV253RW1NWGh2ZFN6ZWdv?=
 =?utf-8?B?dlFzUzJIREhKcVFOV2d5dDFnTDR0c3diN0tDTGltTG1INlJTN1hGdE1sUmFt?=
 =?utf-8?B?b2RMcEFYS2VhVm1yR0NTUmxBcUIvbnZZU2FTYjVKODFQbDJhY3dORmhqNG5F?=
 =?utf-8?B?azFiZTlTcTZzc25rYnhCbkRjR1VESml6N0pHN1psSVllcHFNeCtuM01zejY4?=
 =?utf-8?B?L2I0bGVDTDkzeXhLcmQ5cHRNM1YvV09kL3poTXFyZlNpOVRQRmVWTjg4U2Jy?=
 =?utf-8?B?Z1dBQkJnWHVMbnQ3ODR2QTU2aTRublJ4em5mWUkzdWovbGdpV3NOdk1YSjYz?=
 =?utf-8?B?bEZ4dGYveEZVa25BK0dYQng0cmVra2lvSkVMK05tc1VNYitKNDNiNEFhMnBJ?=
 =?utf-8?B?dGdlbUZ3MlU2cTRhYk9OY28rK3hmUzB4Yzh4OGJMQmxmaW5POGZxT1hFQ3ZM?=
 =?utf-8?B?Y1hHdW9qV09VYlNHcDVVU3EvQkRqbXF3WjUwWlhUY3Nac24zeEQ1NDVuZ1VW?=
 =?utf-8?B?TWZRSitGT21SRXhzemVLMDZqZmphSGVQN3BVRGp6K050MEk4bW5CZjMwVXVV?=
 =?utf-8?B?d05xTEMrZGVNMTBUTkJ2T21wS0ZuSXgzbXRNZzdlOENrR3dsMlNzNTZlVFZO?=
 =?utf-8?B?OGtOWVVqSzZPQUFJOGpWWUhJc3BNRnBkc3pmQU4ydEhxY29mRWdYVW9PTDho?=
 =?utf-8?B?Skx5QmpxQk1wVWhleVlMd0NoYjNNWUVxS0Nkc1lUUk9ORUEweWtycTJMczBY?=
 =?utf-8?B?em1LQzNvYVpKYk1scHRZTFdidDJRV2dvSTQwZlYxdExraVVLU2pZU0ltUDBO?=
 =?utf-8?B?QWpMNFQvMDdTZFdocFZsNlFURm5sZUxvaWFxMzFGbkUveTdaaE9aZWVSb3VV?=
 =?utf-8?B?bTJRS1JDQmFRSG50VmF3b2l5VmtQODAvckpLOXNRd0RQcmNwWk9ibjhzNVdE?=
 =?utf-8?B?cTZjb3NaQVMwblFHdWJZU1BFWTBKckEvWFFONmIvREdjZTJQM3NQZDVENlFC?=
 =?utf-8?B?OEprV1BsSUsvdjNoL3BGQ2xMa0xZekR3U0FTbnIzdXZaZXVMdm1FeWNjYklh?=
 =?utf-8?B?SEVMaThhL1AyVHpyYzIwc1JkVVNXL2M4VE1DTTJyMmpTcGFJYVgzYmdPelJk?=
 =?utf-8?B?ODNsZExmMVUwZFI1YWV3dlBpcjVtN2FBTy90bjRydzVLMXAxR1dUb2hqeUxQ?=
 =?utf-8?B?Vkc3ZnRIQVp0R1NUVVozamtqR0VDZHp2MjNMS01neFR4V1krQWV6M3gzRzl0?=
 =?utf-8?B?WFhpRUg1NGhpd0NtYVVmSkV2Q2dzUEVTSTVsRzJjSmFLN0cyRVNJdmNjcmxz?=
 =?utf-8?B?SnhOd0xOWEEyYXg0S0FtTkVhOVlFUFc1YVJuQnZLUlNjV1J6bnl4YjVHUVli?=
 =?utf-8?B?MlRPK2FsTzVybXh5bGVOSldsNkJteFpDWURsWFAxQy9aaDN2OVI5YjRWSllB?=
 =?utf-8?B?U2N5K1VoaUdOMUcrWk50bzlqQzA5eWxXdWpPTFI3bVVtVVkyU1NxQ1RqeHFS?=
 =?utf-8?B?Z0dhTE1LS0l3OTZlekZNMHdpQUs2MGRJVkRXUlNCUUZFRVYrR21ieG1IWVJF?=
 =?utf-8?B?d1E1OGlpdUNjNmpoQlBzTDJSd2d1S2NKMkt2STJoRFBqUUlJaytLb0VyOWlj?=
 =?utf-8?B?MzZXQ2MzbVdzbDlxYjBmMTRaRElrSmJ4aXFNaUxkODQ0MkZIMEdCQ2xMdmlL?=
 =?utf-8?B?aU43YUFnTU56MUhVeWx6bTZxL0Z3VHd4Z2ZJOHRuZkNyZVV2ZnVIVC9ldEM2?=
 =?utf-8?B?Q09OYkRiYXhLWEJuY1J1RFMyWm9XK1dTK2lKd0xpaWpzdjlPdXl6VXRWTEhM?=
 =?utf-8?B?S05RVHlhQlNCNWlXK3hkTjFBek1IVjkvWlBUTzlCd0xSYzdFS2Z0dDhHS2dZ?=
 =?utf-8?B?RGxqZkptSDZyNGppQzRhZ1grZHVJUkNiLzJpWWJQM2wwSkNRRmJTbGdEZ0k3?=
 =?utf-8?Q?W+WoWO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3JrRHFidlJscjRGR25UTldIMnl6eUpIeFVQSVVsWm5LNGpTOXlHZGk5ZWV4?=
 =?utf-8?B?ekE4WHFJVTBhSzZIdzIwdTg1aStZT0ZUN2JsUHJENnRydE5teVF1a1MzSk5D?=
 =?utf-8?B?V2V5aElnLzlnU3hxd2RENm5tQk03RUhpSVgyU1prRkxaS2MzODBJM1gxMmV5?=
 =?utf-8?B?Q1IzSVZqK3VZcVIxK3RCdnBRQjRiOFJDNGt0a1htK3MzTGJRRWxCN0M2VHE4?=
 =?utf-8?B?NkhZOFgzdUpkSEE2MUJ4SHZiWVRleDRyNys0LzFzTis2bWlqT1FxTkV5Ylo5?=
 =?utf-8?B?Qjd5Z040US94WldCOGRDUldYeUh3TnI5Y3h1UkJYRHJnSWRyeGNoYlRlK3ph?=
 =?utf-8?B?WFR1VWRQRGN1MStNZTFqWnZGWXVkVlB2NitCZis2aWdHOVZXQ29zKzk0c2ND?=
 =?utf-8?B?Y0c3bXJscXNERFphemR4ekVJWWwvWjFDeWpSc1hzd3VTWndHN1hkQm5VUTN3?=
 =?utf-8?B?NVl1ZUp0NHRIUTZCbURGdFI0UERXVFdKSHlOQmdyYWJGYnlnYnZJUDdqNEtY?=
 =?utf-8?B?Nm1YWWJ2bDdEQTB0SnhLRm11Z3Z2NEZaQWpwWVpubDlTdmhqTVhycjZKS3RN?=
 =?utf-8?B?Si9YNmFXTS9oQTVNQ1RuYWJiTEppNENuZ2J0UUp0dDFzdVAxdDBKclBva1JW?=
 =?utf-8?B?b2xpRk52dnRuOEdpSzFDUTNlN2daSVZDZkh6eXNPV0FNdUdXaHhCd3FLSzZT?=
 =?utf-8?B?dUdPQjFvZ1ZCNjFxenVsbXlOR2RySXAwNnlYZHJiK0FVdWcyUkRlQjZEdU9L?=
 =?utf-8?B?THl4ZTBGSXpQK0NzMEhhUCtKNXJpSms1aXNONzVONFZTczIwUlVhbVVkaFJt?=
 =?utf-8?B?UWRaSERsdnRmY2w0VTNKL3lsbCsvMmFVTEdWN2JqTHpTTHJqa2g3Q2Z0RUdq?=
 =?utf-8?B?cGVVeG9LL0pnYnZFYkttcjIzZXVUMHBKalJjdTF5Z1E4WHY1NkduVFlTUFkr?=
 =?utf-8?B?K1drWWsrV3ZqUHRnR08xbEZIeFRYMytaQ2hxZ2NMQkVPS1Q5MGNpRjdFVmJI?=
 =?utf-8?B?K0tBNnptQjRvSVFWR0Y0VFdWdk9LS3UzL1QvbjREY2gvWDM0YXdsQkFEMkpC?=
 =?utf-8?B?KzZqNW9wdEVTS2hGbW5pU3VpZmt3MmpTbWltY05DTmRWMkJyc2VCVUptV2JQ?=
 =?utf-8?B?c3J0K2NhTjkwYUhlQUprMlMrUjdDMlVtMHRZeDF3SmVrdEdnVnF5azhIRzJQ?=
 =?utf-8?B?Y3htaXNTdnp3WmMydzZhNXNNMStQbGpaWEt0ejhja2xZTHcxVFZXbXFkVm5p?=
 =?utf-8?B?dFpyT3d0SEZ1YVVEOVlmczZUajVnV2JyQmUzWkR0RGJyM2Fkay83dXJSZU5F?=
 =?utf-8?B?T2dITW5UaHFQd05Sa0RDUU1aSVp1MThPRXNkZDMwbFJzTHMyV0hobGxmSjNs?=
 =?utf-8?B?Q0U4Tkx0WnZyZTNsN280U2hCaVZnV0k1OHpDMWZIVnVmTUIvcWMyTW50TnIr?=
 =?utf-8?B?ZmdaZTY0MDJ6WmtZNVNoQ2dFTElYYjhxcytHT1JnWGNBSE1OdGcyK0syUTlW?=
 =?utf-8?B?cThZTU95SG1rMEh0cUJQUmt6YkZ5Ym5oQlFIS2JacWluNVR3dFBjRzltd3Ft?=
 =?utf-8?B?QjVjZ0FwYXdNemIwWGtiWUVVUXR3UVlwZGNiR3VHZjNBdEdzM2F5Nmh0YmZU?=
 =?utf-8?B?ZGZ2c244KzRIWHNsUmpqN2RJRUFqK3RnOWRGb2NOQWhCWUlEVDZPWElVeEZV?=
 =?utf-8?B?TW1vZWRoaHBwSExoN0x0ZzRFTEx2YWVoVUJRMkgvUk5oRi83ZkhJSktZR292?=
 =?utf-8?B?TWpjL2wxMTQ5Sjk3QnFYSDNCem5lSVZWNEkvM2lQSHIyUC8wRmxzbjRVUUVV?=
 =?utf-8?B?RS9uTzBLWE9wd05ydmRReWQyQURLTGdIbmU0cFVTNzdTcUpZcTRnQUtQa2dn?=
 =?utf-8?B?azhHNVVlWGZkcXRWdlY2ZjR1VHJhbktoRzBQdWNlK0xuUGVzbTMyZTczcGo1?=
 =?utf-8?B?UitFd0dmcGVZZjNQQ3RDd1o1TU1UWndmVi9mWFFaYlk3TmJTOUJrWm9kaDBm?=
 =?utf-8?B?dUFCTDBzVWRYc3E0dHp3c2puNTlBdVdaMTB0djVqZzhVelQ5RVVNTFhvc3Ix?=
 =?utf-8?B?cDV6UlAyVzVqcWxBb1pWbXQyT0twRy83bi9JSWwrR0tGRitSblowSTlMemhH?=
 =?utf-8?B?RjRoR3NsTUNqUHprOUdtYndKMnRnZW9YSURqTm5naHhhQm83QkhiOUJ4b1pn?=
 =?utf-8?B?S2NVS2hCbHF6aUNKUXgyT3czVnpqa3gyNmJlV00xMXV5a0s3NStFRUlJSWJ3?=
 =?utf-8?B?b0pRM3hsRS9qVWxDT2N0bEc0aHZheG15eUpsVGNwWFN2eXJCL0lFTzY4eXE0?=
 =?utf-8?B?cksrU3NpdmRkRjUxejZ2bzduR0RxbFp3Z0syWTgwSTBGNEU1WUtBV2U5dlpP?=
 =?utf-8?Q?aRxOKj7YFBMwf7gQ=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd69f1d0-c134-4ef7-25fc-08de4eb4a361
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 12:51:27.6109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nEpJDWumFg+1qg/iv7ioZGYKe3Yll+pfCod2eKVi1K55uZBqsSZZxia6IOmn+nxfcbL8fqZ939dCgKtTdjBsxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7456

Enable check to not overflow the calibration
max value.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 856bc1678e7d31144f320ae9f75fc58c742a2a64..caacce3725e2ef3803ea42d40e77ceaeb7d7b914 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -349,6 +349,11 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 		xrtcdev->freq--;
 	}
 
+	if (xrtcdev->freq > RTC_TICK_MASK) {
+		dev_err(&pdev->dev, "Invalid RTC calibration value\n");
+		return -EINVAL;
+	}
+
 	ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
 	if (!ret)
 		writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR));

-- 
2.47.3


