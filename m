Return-Path: <linux-rtc+bounces-5840-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA1mIOQ8cmnpfAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5840-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 16:06:12 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E456F68583
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 16:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D1F1988BF8
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 13:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE003451BB;
	Thu, 22 Jan 2026 13:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="ynaJfcpW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021093.outbound.protection.outlook.com [52.101.65.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CD733C53D;
	Thu, 22 Jan 2026 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769090046; cv=fail; b=OTcW8+e/WkNOKaDhvmG2REb1Kxu73SlrXFrLfJcSbXczrRnrV6SCnc5sJesUEXM/jRHXhV2ur1LxlZq7qLqVns4eQRWcwrJWVAC3gKn2U6PTnx1dp9xcq7l+cLkpUPwelI9Jf78uEGM0O0k0Zw4zz2NOinVXuAq49hxTXSV9Z2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769090046; c=relaxed/simple;
	bh=3b3yY5Ig1J+IimHefHjVyESti/NVRS/8WygLbnbciQw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IHBgOKAFlh/wWBns7kkv+EdUKopweB56AXjmRHh7uscrSvCUhTUUld14ELR+MOo3bAH5PijPYYUSssehXldyr5eiA7AdD66P/sVlBIzzD9ITlhTIsO18GstX8ZmxhJpgmlF6onrb354UfBwgrAvLq2DPf/f5DVhqOMuLnF6qAIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=ynaJfcpW; arc=fail smtp.client-ip=52.101.65.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpNDcoadrOTPBIhHAhpajYk/Fkv9+hPrTR/HYKwUqNpBHpJNq8Q/6ey7h/2ZZ2z1IAdUZzOvLAAzAoxiB6CyBqu1SMKdY5MOmQH/Fa2ZyBwoWnu4JW9yyhjda4X7LoTLn/q4HMgj7GKoXaqzvIkA5plTX4xeMpCpLnAEkv5rDLvpI7EfzI/o3/NncuIyj+H2GOesQz9YXm2Tst18qozSH/PRwM6TA43CpgSUovfj7BHcil9tIXZ8i4blNFskZBzDr0kvfoO4UY1fTut5cYyq8BUQVWv5aWrJuLcXoWMvpc09x6bqKL561dBsze4ZlVJlliICOJO3cSiyjBXL1Cu8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPzEsRMbnQVQLXhpBp0Gdgel7pFOuyddfchCgCGUSRM=;
 b=Oh3gtL8v+fXuOIjYjlpWrAMmrnY+1wF0IYXqwJlWLhFF6pDXnhmTfrORy9uqTkDJ0zydY+UQWDLhHTST/+9bOsAIl2mpQUqInCE2kl6I48o9jFAkf+brqEQzAwXSsRiPX0NFB3yf4aHD+6W12PFkEARNjjGlo2INZkH9iT5xejaa6UfCHSgxfQ9YNhgzEyEDAxeKt45gpkjrpAuIXgzzg8BJmxqrIsVFRpfkYaNiQ2M5QxHt/zs1yBBPxzZNXDUBCWcLPjZsSiqjgeyRjfPep37n83eSlg4W81+NAhsojK4rCnxoLdaPnxFBUG7cDdduIbCD7oRMe1jGuj9TC5NlyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPzEsRMbnQVQLXhpBp0Gdgel7pFOuyddfchCgCGUSRM=;
 b=ynaJfcpWnaRx8jKRSlun9PTDMq66tQLFhsokenPE5H5DB6mTm53SF8xWpH+qRUWzAtrakVC9xalXZ5P6mb1fRpCHlxC3o+K9GnPjkLVVQyQzK/jO6AvwYLwq3eQxTxBjqnhPO1PdbiFyhCad+Ku7yvujYDCMrBlyLcDLLHBRJt4hqt3NVQgv232uPH3eAWYamVkPvWAWEVppZD90qYTfW8z6YsyR2WAMfnDXUyWmglJWmNNUKNkTEdxOfIMdMzKsa2TUjfwNyW2g7kCCuEID/736kMo7oFiiZTshg4PS82FlPNTWC9nKgPNaZT8goHIKuNLcTdp9p9p8chde05P2uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by AS8PR06MB7413.eurprd06.prod.outlook.com (2603:10a6:20b:33d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 13:53:54 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 13:53:54 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Thu, 22 Jan 2026 13:53:45 +0000
Subject: [PATCH v4 1/5] rtc: zynqmp: correct frequency value
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-zynqmp-rtc-updates-v4-1-d4edb966b499@vaisala.com>
References: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
In-Reply-To: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>, 
 Harini T <harini.t@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769090031; l=910;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=3b3yY5Ig1J+IimHefHjVyESti/NVRS/8WygLbnbciQw=;
 b=wZjV82Ia1T3dNn1pJfgPSJ0cFnXHIHi8f4AgcD4p8Bs9rUxi8LYy0UY1NRbYKMnFemGtfzYYo
 JC8+vQzTfqlDhZThwQ+m0y6qVfiTzcVGUKT1B8QlaryAKFQdLW/ehtw
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF0000384C.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:e) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|AS8PR06MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c644b1-ec02-476b-fee4-08de59bdad8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aml3TGRCY0xrU1ZPOWlONm9QR0hlSDVqVVJpbUNibmRkUXN5NFBVRnZzcVc2?=
 =?utf-8?B?bEhqVW9IUWRKdXJ6K3JiZUEwV0VLTFBHNG0wSVNOakRyemJaL1o1czVrOXhQ?=
 =?utf-8?B?dlp4MFFuNHVqSW9oWk5uR0ZBYW9WY3J5NUEyUjJDUGJTaEVaM3Z3SGlQNnU2?=
 =?utf-8?B?QTVVVGZheUdYdkNPWlJMZFRXQmI2OEQrWmI5V2MrQjRKdnhialpzQWpRZGV2?=
 =?utf-8?B?ZTZrVDJQSGhsdlJMUUhlS3hhM0pHVW1qQXBFME02dWZqRkJVR2RvbmhHeWFp?=
 =?utf-8?B?eVdLcGViNXVWSnJuejE1TU54SGdPbllJUGQrR3B0TlY3aytHak1WT3F1L2RI?=
 =?utf-8?B?bGFhZ1BqMTFZdjVna04wTFU4Y2dURU1zS1JrSmNNVVFUZ2ZzNXhvWXBXczYw?=
 =?utf-8?B?YnVlWE05RTVVZE5ibjY4TjhacG9tYUJ1VWl3bkRKNnBLZ1QrdUhsUjB3dmMx?=
 =?utf-8?B?R0cxcm5yeEluYjY0UXZXWHlWd092cnM0L2NIUjZTVkNXMXRRLzFwMTZwOUpi?=
 =?utf-8?B?OXJuUnJWTTl1WDBIVUZqTTBFZGhYRzJGTUNEUzFkczdmU3BZMHBGZlJqai93?=
 =?utf-8?B?blYzUVpYdGQrSXh1VVU2VFpZcDFvZ3BsaTV6QnpxVHRzNlhwZC9KU20vQzF1?=
 =?utf-8?B?MGZPSmYzMEt2TGNWQXlSSE44OWxmZkp5ZUxmOTRJSnJQTDlyME02ZlRJUE5E?=
 =?utf-8?B?eThKL0w4WmRvUzhHWFd3ZXJkUEtrMzJVWWdkQTk4M1hrL0F0emRrY25RL0Y4?=
 =?utf-8?B?anRKdkYyekFLTW9RemhhSktMZTJCVHV3dVlvYzhoU09wNGE4TlJSYUxBazl5?=
 =?utf-8?B?eGVPOFpuL28zTHBsOS92SWszcW4vNWRRamFHbXUrRnA2Z3REbWR3OXREeUZ2?=
 =?utf-8?B?NktvajgrVHB4M1hvNm1pZFpvckh5VE1sdVVwRFpjKzVCMm5ZdmJtam1jOTBS?=
 =?utf-8?B?NkVkeW04eWpzYjZ4bjJyTSsxL0gzajVUTXhuZWhzMlFZRVAzQ1JaTmsrcEFD?=
 =?utf-8?B?MUV4T0FEckVXMkNsL3Q1emxrVGpaaXZuaHBjOXVCbzJSSXRYK1lrQTJuV0VH?=
 =?utf-8?B?TnQ0dXVhTHA4ZWx6VFJzeTNnWU9VNU82TGZqcDFGN2RjUTVhZTVlUytsb0ZN?=
 =?utf-8?B?SVBPS1BrdC9mVnpBQTFIYVNCVHB4ODQxQ0NVeGM1b1dpMWlEcWp2K0x0NjlC?=
 =?utf-8?B?NHRiMWE3aGxjYWN6WmN0alE0Y3hYS2FPTC9IeHY3T2o5QWVhcS9xc05xRnFu?=
 =?utf-8?B?ZnV1S2M1WVJLRHE4bWhHZFJ1L2FkOXBxS2k4Zkp6WEtJL055YVFJeHBnU0Ur?=
 =?utf-8?B?MWVuQlYrVFhIMnc2aXI3MlNSTkxFcmtCOVVraWhudHJQakdIY0EzdnlsMHQw?=
 =?utf-8?B?eFhkZkE4T3cxNHVYblJGSjBuZUIveUhHN2o5d2FIUjFQVUdVVlpxZ0RHdzVh?=
 =?utf-8?B?aVhvNzNXb25yNGRDTlZkVnIrdXMzaFpoSWJJVEJoeFN0Q0VYTDZ2Qys1TEdl?=
 =?utf-8?B?WDJFemZTUFF1djJqd2Z0ZmdNSW1va09GZUtBNUdyRFUzZnlHVWs0aTVNVVpG?=
 =?utf-8?B?OGZBajBGUk12Z0huTlJpKzk3bHZhWU95c3ZvU21EcWdyN201S2hPRUNvZGp3?=
 =?utf-8?B?SUtMVmVlOVV5V2JpbGgxR1UrRDBQYjkwZjZrck5hUVBabzFXZ2lDMnowM2NR?=
 =?utf-8?B?M214d2ZqeXhReHRicnNsL0JCZkNOcktQK0xCbjlTY3Y1YkIycWZGNzVjQVdT?=
 =?utf-8?B?Z1hycHU5T2R1MkFYMUxqVlNVR3d3R3dsTmczR1dvb3lTNlZPbFE0L0dEVDlG?=
 =?utf-8?B?UW9SVnc0TmNtc1JaSmJHblNiNGNoSzZ0eXJFdWNENFd5TXNmbzJ3ckVRWklm?=
 =?utf-8?B?UGZLbGtLRko3eEsxcWdGNDFYcUVZMVBaNDFTZGlmc1Bzb25BVEw3YUFZK2tP?=
 =?utf-8?B?TFo0R09lclJNcDl6cGxHK2V4ZC9uckVFMXJBdUl1bFR6KzFscHB4emRNKzU0?=
 =?utf-8?B?UnYzNzZSa0tyUkhuTTIrWk5sVWZ4V0xhQjd6V092NW9BSU9LaVo3aTg3ZHg3?=
 =?utf-8?B?SmpURGZFQnBBU1lNcldEK0h5TW1qaTAzR1p6VnlITFJGZmVOb0IxdEVtemhR?=
 =?utf-8?B?cXhBWlBKZHhRd1FTcFN5ejdvc2cxWjVnc09DdWYrVjV6MkhKS2V0a2p0UVdr?=
 =?utf-8?Q?i4IWvtuxv4Xa2MfX2c6gQVg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVN1cU9zK3ZTQ1U1RWdtRGpqSUg4T1dUQ2puOG9UVDNOOTZiV2N5NnhWMEZa?=
 =?utf-8?B?NUtUY0tKWGlyaUF4dkdmK0dkTGk2NWVIRjVoL0RoMVJGclV4YnhrS2JWdVll?=
 =?utf-8?B?UVBQWHR0YVlpQjVjMGlhVVlQNlltanhJVVY3T0J4UkZsYTRVdmZ0WllFdXY1?=
 =?utf-8?B?L3VIK2MwRFdkd0FWVitsVkw0MldndTN3d0JIamdpV014R2luVjVnUjJNZXZ2?=
 =?utf-8?B?K005Z0ZmenZ2NXZqcVBHckdvOEpFdDVaaDhSRUdDdVlhNjYwL3M0eHFNcEVZ?=
 =?utf-8?B?Rjg4eGZybXVWK0VydXJsWk5rZUZUVUY0K0RHSkpXZXIzb0F6d0xya2N0UFpJ?=
 =?utf-8?B?YXkrS1ZxWUwzZCtqNVR2OGhZQ2hJQTZzblZhYTVGUjNwV2Q1akFTL28zakZp?=
 =?utf-8?B?Q20yT1dnZDB3blBiSEMyazd3V3VZb1UvOTVvSHlHMkVXbDNOUlNMQUU1Y2Ur?=
 =?utf-8?B?eWVFald5VWI3Z2pBVGhJM0owWkNRTGJmdWNlLzRrVkpIazhXUlBpMlBuWnJw?=
 =?utf-8?B?UkUyYmRyZUc4Z1lRNnBQTytDYWhGbklCNlNidk9YQVp0S3BIS01POHp3ZFBm?=
 =?utf-8?B?UGtpVTE2R1dmZmpoU1FJNS9CNmw5VEF4Y2JpKzI1SnZaSlg2aDBobzJzVVdt?=
 =?utf-8?B?MEZWV1lsclh5dVh5bnNaeU10eHAwKzhldmVjNEVmRTdJU1gzcGMvOVlWWHVR?=
 =?utf-8?B?NGZpUDNiam5WaTUrRXY0WGtCSHJvdVhGZVFrczU3MkM1S2JYSlk0d21FWGF4?=
 =?utf-8?B?OGZtTndBV2x6RGFPcTE5bFNhMkxtNXd1UllDQVBqMVRocE04ZmFibkRUbXcx?=
 =?utf-8?B?cGdwajRGUUpGTFFMZXdXdmVJREpXUkxqWWRYVURHY1pYQTlGQk9IOERLMmZE?=
 =?utf-8?B?UHc0ajZzcEFWM0ZScjYwMlppbms5c2lZTlhhZitBNnkxRk0yTjJGVzc4QnFy?=
 =?utf-8?B?YVBFMVdJbWtYTVJHZXMxQ2REMVRLODBQYzdDOVQ3ZHViZXRUWlJnQi8vbm1a?=
 =?utf-8?B?MWJTdFJyaXk0clE2RlJyUzFqeWZUZ3c5YmRHL2FuNUkwc2U5REdEZmN3c0kx?=
 =?utf-8?B?SjlyaUJKNmtIaDVKZmNlNHF1ak9nSzRDYnp2TEE2bmtKdFMrRGJCcmY3V3g4?=
 =?utf-8?B?a3NGcWdXOXp2bnRFazFUUzhrVUp0OHdMZlZSMnJYY2ErR0w5L0ZoQnEybFBS?=
 =?utf-8?B?ZUdkUjFjakhpYjFtK1RsZDN1VURPWm5pa21IV1NramRWVi93ZzZRZDl3Qmxv?=
 =?utf-8?B?dFp3ZHFvdkFPTmdIeGdSMGVFTWpMTHkzOUlobldCSTdIWWRPY25tdGoxTjBy?=
 =?utf-8?B?MFI3R2krZHlaWkwrL1I3cG5vM0FORDdWWVJLeE4zamZ5ekg1OEVWRWtCMkdm?=
 =?utf-8?B?aCtKSm1pOThndTdyd2RsY0dDVjBPN1B4SkdjSVNFRTFwa2huTWNmR1RwUDd4?=
 =?utf-8?B?T0pKOWhaQU9NT2JaT0RJbEVNU21CN044Tnp2ZVI2b01Kc0pYR3Y3Q2ZGTE9i?=
 =?utf-8?B?MWhHODliaUNxS0oweFhJMzgrMXQ1YTdZNDhsZWxyaWpHNmZ2TC9uUFpyNldo?=
 =?utf-8?B?NGhQN1pDUzdyQWVwbE1LQkIzS2hBcEdSbXNWSnB3WGN0VFQ5dmpUWnk3dVNx?=
 =?utf-8?B?d1pkVG9HVFpjcG5Gcm1ZR3F3dG9uc2J2bll6MDc5YzhOVzBWLzhHV1pzSmQ5?=
 =?utf-8?B?bjN0NjFFcWtiVStCU2huMWRZMG5hd0VtRTBWWXVtc3JrQXh1K2I1aDhrMDZh?=
 =?utf-8?B?cWtEaFlTbXNrb0NTdWJ0WmYxYUlGOTdsbVJDbkswMHdWQjhackwrR2NkeHk5?=
 =?utf-8?B?M0hiQjZ6bnJBMmR0MEdydWRWeGk1eU1mUGo1eWhrR01XMzhIYjRqZDNxQWk4?=
 =?utf-8?B?dEJPV2pMU2pCWU9BTU9zVFlvMDEwcE0waU51UU8yc25Ba3ZPWmVTT0NqeGE3?=
 =?utf-8?B?MGJreGMvOGkvUDNZZlh5aWJzMXpaRmNDa0hjMjdUOE5vWHowRlE2cERMYmc0?=
 =?utf-8?B?VVYzMHFGWjg5alpUQXpyeTl4UHZXN3JFblRBTDNKL202QjBVenR1clIyN2Zv?=
 =?utf-8?B?U1F0eHBYVEhyY242NzNsMzJmSWQyYmtDVW1haWVpejNMTXlJb3UyRllBSE1h?=
 =?utf-8?B?SENlN1RkYWZZL2RxcmorMnB5czJrbjk0b2E0aTlPN05VNWlyYlFya3lnR3l2?=
 =?utf-8?B?MDNadXlWODZ4UnpVanF3N25jb0RGOVhaRXgrOUVzcUI0R3BSdjkxSm9kUHph?=
 =?utf-8?B?aXNVWG04QnEwUmhSQUxJV3pxV1liY3UrZnZucEgzaS9mU3luME1WbWhxSkt5?=
 =?utf-8?B?NHVQSVB6UlFsS1JWUGJOYVY0eUMyYnJOcVRqOXU0M01IVmdWNldEQk5mZzc5?=
 =?utf-8?Q?NsG65zD9t7H6LGpI=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c644b1-ec02-476b-fee4-08de59bdad8d
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 13:53:52.9400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vH0G/TqWZ9fFHukNIACbmyCNEsW5mv5y6+4gArNX/cYxZNe2Nu9b3VGjnA1CSKoxRtdUNAQPckIbbzGtr9RzkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7413
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[vaisala.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[vaisala.com,reject];
	DKIM_TRACE(0.00)[vaisala.com:+];
	TAGGED_FROM(0.00)[bounces-5840-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-rtc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomas.melin@vaisala.com,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,vaisala.com:email,vaisala.com:dkim,vaisala.com:mid]
X-Rspamd-Queue-Id: E456F68583
X-Rspamd-Action: no action

Fix calibration value in case a clock reference is provided.
The actual calibration value written into register is
frequency - 1.

Reviewed-by: Harini T <harini.t@amd.com>
Tested-by: Harini T <harini.t@amd.com>
Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 3baa2b481d9f2008750046005283b98a0d546c5c..856bc1678e7d31144f320ae9f75fc58c742a2a64 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -345,7 +345,10 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 					   &xrtcdev->freq);
 		if (ret)
 			xrtcdev->freq = RTC_CALIB_DEF;
+	} else {
+		xrtcdev->freq--;
 	}
+
 	ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
 	if (!ret)
 		writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR));

-- 
2.47.3


