Return-Path: <linux-rtc+bounces-5844-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aETrOtU4cmmadwAAu9opvQ
	(envelope-from <linux-rtc+bounces-5844-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 15:48:53 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E77681CF
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 15:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EAB2270CD3F
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 13:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C6434C141;
	Thu, 22 Jan 2026 13:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="ZtYn1gey"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021093.outbound.protection.outlook.com [52.101.65.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B703491C2;
	Thu, 22 Jan 2026 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769090060; cv=fail; b=FoRpchkHDkj0doBZiU8kbJh/jR/8S0iysho1zl0Ebcat08dLTMHPKBEBhu+bbi+RzG0sknqeA7TRvEsWtqPuDgpWwuwZtU7YjmSGhcpABzbuol2kbbG7y01DfBUqngjyxtx15zETGsrereJ47D8mnJtEEaKtZxim5AjELv+9mlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769090060; c=relaxed/simple;
	bh=idY8GQS+p8hZb6GymVjyfMRwJ4wEksw4Ml4LKR0RGb4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OKLf6Z532NQnKTdEauU6p04SBSgI2g50ACmwQmf6U94DlyHCEdwo8+jopll5znjP+gL4hoVwxIneU4FFNzYJV5xozXTvn9NQamSdmRy+BKzM54EQNzpU+cKhGgLA35cTwmx9qGSIYC+ejTA7Pb41cLNbsH1EUWlNCDnyJ2Y7xsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=ZtYn1gey; arc=fail smtp.client-ip=52.101.65.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qn5q01djLWlOMxya5e6qr27MUQ6cmRYnXihrHwXe3EhwT1B1UZLUbIKETSdewWfzNDDKL8e/MuUjNP9Ydmb6nAekpg7xIZO5/yIvqluczg5BnzPtv82YTRrA7tDtehoZYLmEuyTpeXsaIm+uruf8bGC+9hvKGfE5btt0YltnUEvWqAK5+Hea/jYNZloCF9ictMq0YokHZXQiil/bbWrDZuhlivYXwNNcgVSDKZrdgZ2IXmGAhb1b5cQxjj2QTs7Sx0NxBSaapNFaVQ2ATbH+JFtLOjii9BmrKtOBgAv0mTyQTP9BDHvcxlOIdvCKdxcuKbdE3/kO7O53F5WVQI8hnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLPsm7TlnkzHEQyuIhcwEjezrTctrDju35tFKdHKGqU=;
 b=laxBO/Fd798tZgYLVFVrU4wFBO5Q80dcR7CWXlarEZc4xVfp8ZkgOd078RhQnW69dnCpYPMpP7mqw7+5+asm5S31mKgZ288J3VMY8xm8kKk87P6nnEbNM3D5rfgA+nrpEnpdSWNSSQ7T53YXztw9KPYnNq1it6LTZkmJr71kXChigTXaFw5o6rHFDLrHF5ZtZZAYurxQ8OccT43NNJ+tGo9PROeDL7jngElyIyj/7t97188K0XXyCec8PV4WpJ8MfElqsGjyrjmNoLOxk63Axf+hvA6zm4fRh/Fcm/DKU2buwMwXP6jsCwo9MD+WbSD4q+NyJRTI6+S9YCyL6AFV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLPsm7TlnkzHEQyuIhcwEjezrTctrDju35tFKdHKGqU=;
 b=ZtYn1geyuNYWfzaXyWZrAkTNpMD1/sYJgom8vUVx6pUTe+TMCs69kO68ZaD9kc0vqbinB4jouOccsfmyu+fo+CuNDyHZBIXeaAuXQeQrk93QDOGcAwEK3aUnZ2J0O5KSv/LdTPo1FLeYbRDMbIW+gz65joNmboCSqOWMeynL4Jf4nEIheyOey3o9srGiAwaw0CHVGFYZZVnSoNQjShSxkwnVCY0JKo/qWy68xxa9VdZMCNZnA5UwGb+q5qp6Ehf77u4an26pE1VD8wHybwmU0EWutMhdqqZsx0+7rOloG33uPUvuFnWXei6qpLRnLm3hI/MlJoxZcbX3+Ky8jB9rBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by AS8PR06MB7413.eurprd06.prod.outlook.com (2603:10a6:20b:33d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 13:53:57 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 13:53:57 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Thu, 22 Jan 2026 13:53:49 +0000
Subject: [PATCH v4 5/5] rtc: zynqmp: use dynamic max and min offset ranges
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-zynqmp-rtc-updates-v4-5-d4edb966b499@vaisala.com>
References: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
In-Reply-To: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>, 
 Harini T <harini.t@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769090032; l=1437;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=idY8GQS+p8hZb6GymVjyfMRwJ4wEksw4Ml4LKR0RGb4=;
 b=V9KJcgyeMmlH8gkYgVGPGVyVPNdzx5sEd+17XbdptwZiTDFJ8OsdqfubE66+jWHtY5FhW7jPS
 3IJmjhGv6fNDZCR0fdI9aKOG6sRnEaMZUjk105vr+ys4L5JNzQWUjbe
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
X-MS-Office365-Filtering-Correlation-Id: de398938-ecb6-4c7c-f163-08de59bdaee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czdiNm01MksrV1oyTENORGd4TUVJTUdmbDF4L2lWQUlRNEtxWE5vS0xYaCtT?=
 =?utf-8?B?YWROQ29GYUlSMnp1bWxNc1AyT0kyZ0pCR0ZZQUNnenQ3YjV1cS9Id1NxcVJS?=
 =?utf-8?B?cEtJclFTcURNRDVadUk2ZnIzTEJXWnd0WU0xMVNQTm14b3hDbFc2N1N4TjZm?=
 =?utf-8?B?Yk5uR2FIbWphZklKNW9lOEEvaEt3Kzl2Zkx3WWhISXMzL2g4WjB0dnJ0OU0x?=
 =?utf-8?B?K01rRkdlWTUydnhVNDd2SkFGOW8xUVRGWmoxNWNyNlUyYk1rMU5LL2NxalF5?=
 =?utf-8?B?M2ZPTWM1ODdxNEZvbkczNVNCUnRjR2hhejJpYm5xQVpzM253bmNSQzVoL1Fh?=
 =?utf-8?B?TklRbDJkSDRNTkpoV0VDU1hUZkZ6V2dHZEZBdXc4Ti9IYXFXWkQ2Z1RxYjFD?=
 =?utf-8?B?TjM2WlJxYUpQcWZuMGNzMnFpM24yN2xlNDIwSmo3dGtPajVnUUlPRktzSnRB?=
 =?utf-8?B?SzBBeEF1RHNIOW1oc3ZmWjZ6T3RpTWh0TFQxWW4vcHBFbFhFVVR3Tzlqd1Nx?=
 =?utf-8?B?Q081bHN0RXNReE0wOCtCK3hYOXYwaXdFdllsTGlSUGkwcDZHRkp2cEtCMUlo?=
 =?utf-8?B?SmlmT3ViUDB3dy95OXB4RU14U1RDMWgvWm5EdnpCUDNwTlpSNjM2YTRmQ1B5?=
 =?utf-8?B?R1ZGRXFmZEZURHFsRkV5R1V6MEJmKzQxRXRnekZ0MituUDVPdGgrTGt6R0VG?=
 =?utf-8?B?LzRBZlYzZndNaEsrQmNZV2puLzg0OGs2TkY3RE9hOUNiNFlFTEJOS25zaU5s?=
 =?utf-8?B?SUp4V3pQd3o2MWxQUnFOa2luNTFlWGdQd1crd2Y2aGVTMEk4OTZtSUh4Wko1?=
 =?utf-8?B?b0xGQy9lMExXZ3ZYYmc5MU11UU1RVHZQQ2kyYTB2eTIyaUZuaXNvOVM3YS9o?=
 =?utf-8?B?cXY0YVQ5Mk45QW5JRFNCMmdVclZ3WWtpY0xkTlEvU3hQZXV6YXlvWVIzZmgx?=
 =?utf-8?B?OVJUZlRjRU5ydHBQcUROMDNaSEZCQjJ2dGtldURsbHVwamVONDVVOFIyUDR0?=
 =?utf-8?B?OFQrMDJCYkU3a0FOWjVLYkpVZzhTdkRmdHE2anhBT1p3MjFnNHhRajd6QTh1?=
 =?utf-8?B?YmJuWUk1WklNMHR4RC8wa0JEcHc2bEpqbDl1RDZCSjI1cEFveE54REFCQ3pX?=
 =?utf-8?B?WnhhaGkxWURZTXlrRXBYWFRNYm91czV4N2NoMmJoRGluK3dVRFgwa2d5S1lR?=
 =?utf-8?B?VTBaNXpUVTY1dytlSXFQeGlFQUg0OFNvcHBSM2pmbHFzTXpQaW0vTlpwclRp?=
 =?utf-8?B?M2JHMDBUeUYwb1NKaENpeTVmcVk4bVdlazN2SU4vd3l3TzF6ZW5ZdFRVbHg1?=
 =?utf-8?B?T2JXbTlZVkFXM0Y2SHpsMW5vNUpRTlp4Mjl5Um0xT05PU1A0ZDFjUXFSZFpK?=
 =?utf-8?B?clZjdC9MZkVyL29haHBMUUNkQi9kT0FLL3J2dVFtR3Jnb2FHSTRIRGFyS3Mx?=
 =?utf-8?B?eUNHWmRCNmRzbTBNcGs0UVFSeEY1cnZVbmhVV2dmb2d5Z1J6QjVVMzVHcmVp?=
 =?utf-8?B?ZlcwNVIxNFFwTDJuZnU3ZXVrOWNlNkxQSitpa2RUVjZySVRIN0ttM05oTVMw?=
 =?utf-8?B?SlBVZ2pZaXZuTGpMQjFOelFXdTNveFQ5bEJMM2tkNm45YTdLVEdwVzlYN05t?=
 =?utf-8?B?NTNZbjlabEt3MFFaUmovVjB6ZHpsTUhXdW11Vjh3ZE0rTmhudEYwWHE2Z0E1?=
 =?utf-8?B?NWI0blk1dC9uUFhEc3lsejlZenRwdjNYM3NvRmtrT0g1SGttTUJlV3ZlMUNh?=
 =?utf-8?B?THBDZmszYkJRUWFCbDB5VzZXU0dHMVV1b1ovWlhob2lXRlhqNnkwNzBBb0lj?=
 =?utf-8?B?NFAvOEZaYXlvbk1NQVB4amkxRUZRRFJ1M290c2h4SWthKzZqQzRMeWtjU0Y0?=
 =?utf-8?B?eDhNUEdaMWpVWThGSVNPdkJWMVZ6UDVJYjcra0VTeGUrUjFhSFRqSzd6K2l6?=
 =?utf-8?B?RDd4M1BSTHZmQ2MrbUpIaTBGZm1WTy9LcG5UN2pnRU5XNFh1cmVDTVhaUyty?=
 =?utf-8?B?T05kYkdacVI0azc1citDRmorQXBiV0xodzA0cGQ5NFRHazlPa1JRQzlHVE50?=
 =?utf-8?B?akd0YUI2aGptejUrc00wWlJHQXkwdFgxbXEwRjBSaDdOTS8zdUZqc25rZE92?=
 =?utf-8?B?eE5xV2JHMTlaZkNYMXBNZTgvUGUrWmZ0QitacjBhN0JNdUZUTjFaNXZsdHBS?=
 =?utf-8?Q?EXTS4WultVMK2eX0OVylpMA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UC9yU1huZlpVTlZFYno2QTZja2YzSGRYanpCa3Y5ZVB0VlNqS0loVHFKR3ZM?=
 =?utf-8?B?azdjRmlOTWhQdWY4aWVEbEY0Z2lBaGk2Z0J3QktzKzF1WjBsUm4wTjVjd0Jn?=
 =?utf-8?B?MWlLcXJuQWpsOFFPem90RU94dGJvUklhZFRnS1IyRTZTUCtQSUJkZUJlTkhW?=
 =?utf-8?B?cEtLSFkyTSt5b2NtTUhURVdMQWRRREovT1FyWmVNM1EvODdJTlhtc0JLMlBN?=
 =?utf-8?B?MjlvRjl5YlUwOGI4c2NNeEZpZmsxNDhWZVZVUytNRnZ1RmFTSVkwcUFvc3BI?=
 =?utf-8?B?bGZIcG9DekU5d0F1RjFYQytOVXBQL3RJTktBQWEwZWhiY1A2cGorQURzTHZW?=
 =?utf-8?B?SVpzUkZGdm12Y01vTkxVNWtjWGl5NXgxVHNNOXlpZFN2WTI2dnNLS0tJaEha?=
 =?utf-8?B?SmcxNHlaaWhUQk4zS3BqQlhuZUNaalBqNmRBeUpsN3dHVnl3VlNITVhkS2Zl?=
 =?utf-8?B?NHg3N0FZNkRaZE1mbEdqSC9Nb1dkVWZlSzBxUmpCVExCOFNPYmZXelR1ZGhH?=
 =?utf-8?B?cHVMcFhRTm5XTUVxNlhJNTBRZ2ltK1paMmJ6WnZIZkVRVFg1WnpSZ0hzYkhX?=
 =?utf-8?B?R3RJKzR0ZnoxUTY1RGl5dmROMC95K2VERUtob2ZDUTZXSXFSay9SREdwK0F2?=
 =?utf-8?B?QTI0OGtBcTErWkNQWmhKeEFsRzFDVXZXWEp1cTR0ZmVsNjZDbTlBSWRSQzU4?=
 =?utf-8?B?VHh4dDJkODh6anJwdnpIN2x4VTcyai9nT05WRGd4NjBjSDY1NDBYUGtvNHY1?=
 =?utf-8?B?U1ZGdTRKZVFYMHFSeDRBaXhWOXMrU01vVVlPMm9PeVhCS1cwSjlQN1JxOHJC?=
 =?utf-8?B?bjBkOUNRNWYrakxwdlFMbmg1TlhuUHlaaGJsRER5cVgwOWFTYlZ4U2RvUVFY?=
 =?utf-8?B?TS9jS20zVWNFOTMwZWNiYWJxQjdWdFZzNGw5R25ONVhOb3ZvRTFCR0swaWkz?=
 =?utf-8?B?U0M3OHR0U2ZTTVZNdmE5cFJnbmtZSENnWmdsYWFsZDg2YzB5RElsQ1hrajRu?=
 =?utf-8?B?Qlp2ZmZoRnpNZzZZbUFZYnBxKzBLZWovWkZOMEFOUTJtaitNditmYVZPZ2Vk?=
 =?utf-8?B?NnhOR0RXejdIeUpSZmpOWlZ5TTBSM0pYcDFsOGp3WjVJY283dk9UVnBuL0hl?=
 =?utf-8?B?bTBQMVFKSncyTU4xYmYzS2hKQzQ1NW5RU0dYUHpDVFNLR3p6bEE1MmJjenox?=
 =?utf-8?B?UCtTZzFPY1VtNjdFS0VuVmZqRzh5Z1ZrY21sN1JwVTlSS2Y4bWp1cFB4OWVv?=
 =?utf-8?B?Wkk5ZFprR3BWS0pUdWRMd3lWaUZOL0xacGZGSnFKVUxlZFdCM0NieUw4QUgv?=
 =?utf-8?B?Y05YVGY0cmRPci9aTitRMnJIZmZVbG4rc1pkQWEvV1k0Q3NpYWdGT0VhS0hs?=
 =?utf-8?B?UEhhUVBIRmdwR1VYZEFNK01sUllDNTV2a08yU09QT3piQUZ5R0FpMjhXRnBE?=
 =?utf-8?B?OEVYU2dLYmZ6NHpqd3BSRDk1NjczNmJwL21qQzBlT0VmR0I3VWxuSUxOeE1h?=
 =?utf-8?B?S1ZlbjIvRjlqeFZvY0xZc0VkRDBXbHNqdy9QVnlsdk1ua3NnQkNNZThvZFF2?=
 =?utf-8?B?RWRMSnh4VjYycWZOREFvcjg5SkZkVTlOVjZYQVBvVjdZd2h3ZW1FWUVzbE9z?=
 =?utf-8?B?UE9uUFVOMnIxaG5NMW9VcDIvRmN4MGF2UWQ5ZUMwK1lGdXJnbGVhaXRZQkwy?=
 =?utf-8?B?Z0dlbDRKd2ZhN2NXTzNUNDBPVGp2ckFMM0w3SU9MWDlUQ1FwWU1zRDNuVlNJ?=
 =?utf-8?B?QXFxcWFTZ0tnTE5uTDNkWXpHdUhTZWY0M3BnaGhxN0F3WFNqWlhaYy9WZ3pq?=
 =?utf-8?B?OVJQNVNzbTVaa2lHMXdmZVpNaElEWGJzUStJUFBNTFNYcnA0NU54MkxNY2hk?=
 =?utf-8?B?OTQ1WFFzcEJVRmpnQzhSbVhQeC9zNVlyWmlIME9pS29LTDdrZmlkZENoNjBp?=
 =?utf-8?B?MmFhM1RDakRtY2JRY1ZHNlIwanpIMUpZRjEvU1hCNjBHQndMdGhKRlNacTVx?=
 =?utf-8?B?MGFJcFdiTkpqOHVCdy9zMXdoWHI2TEVTNG4vVmNGRmZDblNCVG9uVTJ0dEdJ?=
 =?utf-8?B?Y0J5SndXSGdDQlVhVU1YczRNRFh2NzkwbXRYUFpNZ3FhSTdDOFVRV0JlZnZG?=
 =?utf-8?B?VGZ6dm1XNC9NZi8zVGNsNDNpTDN6dHFzbk9PNWRjODNTQ1JudVNpTjVkSjlw?=
 =?utf-8?B?R05wU05tKzcvb09DT2UyS0ovZlR4YTVubXp5VGg1VW5VZUJRL1dTVzVEbE04?=
 =?utf-8?B?eGxTQjNRVGNrUi9Ga0Vwa2JkUmFWSHJzN3N3MHRLeUgxcTNqMXlGOVNWVXk2?=
 =?utf-8?B?enRUc3B1am1hRVVBU3RxVHZuQUJIMnpnR0g4aVllMXBhSVNuMWJVSmlrd3Q2?=
 =?utf-8?Q?IRlKaqMjVNOZ+fls=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de398938-ecb6-4c7c-f163-08de59bdaee6
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 13:53:55.2512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcbiSmLarNhr+SqlsWP/zna/JgSZ9kZSkYfH8ACUL0ce8VI9gWslWAS3qbojItQokdrCthVly4sN6Zmt3VuVXA==
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
	TAGGED_FROM(0.00)[bounces-5844-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,vaisala.com:email,vaisala.com:dkim,vaisala.com:mid]
X-Rspamd-Queue-Id: 62E77681CF
X-Rspamd-Action: no action

Maximum and minimum offsets in ppb that can be handled are dependent on
the rtc clock frequency and what can fit in the 16-bit register field.

Reviewed-by: Harini T <harini.t@amd.com>
Tested-by: Harini T <harini.t@amd.com>
Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index f0f5dc63e254799ed99927c259c767b30ee877a4..2ae54804b87a47642d118789dc33191c53b36932 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -44,8 +44,6 @@
 #define RTC_FR_MASK		0xF0000
 #define RTC_FR_MAX_TICKS	16
 #define RTC_PPB			1000000000
-#define RTC_MIN_OFFSET		-32768000
-#define RTC_MAX_OFFSET		32767000
 
 struct xlnx_rtc_dev {
 	struct rtc_device	*rtc;
@@ -215,12 +213,13 @@ static int xlnx_rtc_set_offset(struct device *dev, long offset)
 
 	/* Tick to offset multiplier */
 	tick_mult = DIV_ROUND_CLOSEST(RTC_PPB, freq);
-	if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
-		return -ERANGE;
 
 	/* Number ticks for given offset */
 	max_tick = div_s64_rem(offset, tick_mult, &fract_offset);
 
+	if (freq + max_tick > RTC_TICK_MASK || (freq + max_tick < 1))
+		return -ERANGE;
+
 	/* Number fractional ticks for given offset */
 	if (fract_offset) {
 		fract_part = DIV_ROUND_UP(tick_mult, RTC_FR_MAX_TICKS);

-- 
2.47.3


