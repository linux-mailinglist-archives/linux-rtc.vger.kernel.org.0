Return-Path: <linux-rtc+bounces-5782-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2394D3A3C1
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 10:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27E68308362E
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 09:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933B93093B5;
	Mon, 19 Jan 2026 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="ZQfq6R4N"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021104.outbound.protection.outlook.com [52.101.70.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54586302773;
	Mon, 19 Jan 2026 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816315; cv=fail; b=UaOJEpJ3pQyZAMFZADPBqFaZ2jw8o5EVfNY6VdkalsLp6dC2Ik0QLviwJojLrYEabVssuhXSA0iNP+tDuB5+6TNDZukqyIjhD1cCkxHPsRNzOEDRi2r1Tdaz8KbhG2H3c9x4H06qift8lWPMu+oCaivoh6+ApBaKw1PB1ad11QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816315; c=relaxed/simple;
	bh=3b3yY5Ig1J+IimHefHjVyESti/NVRS/8WygLbnbciQw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PkPldWzpa/ARbNkVWMFYf4LzFqVlEyd9aKB82ZqSrzwhCoKsY9bdhDgpt7uTFVwCC9eh5GxrOjVxCUF6tnnL+wtN04phj5r+IL7+HVmMtRfUHVSWNGYvM+n0z9Gw4aat0PDJuBuOPHQ7S9eLmkZ3VqyqVO3FDZyn2d9JuecgEuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=ZQfq6R4N; arc=fail smtp.client-ip=52.101.70.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiviekS0vbG+TtNZ69mYRlbk/kklC+b/nNsx3/AsgahXoL/TzC8niJ6HNugaZHPlN2CklfdPFXGUNtrKNesqEydC8AsY7OZuucwJ4DJ48GdbXqu12GlYPkcMkAZ/dH/qBc18HIupi6YH0gsfnxfrRG6CcwMEskPRXOvnmgKXpCYwZTI7jC3OKtmdnI5xt+zlxQkxB+HqhDMI/OzCbRK4aUbXPYRqLheSYsgqmqLQYXroC+6gs4K4QSjPnJqF8OBAIX3HK9JV9aj89/n3W/gYEztxOkbTJpvMkrF9PU88lg++wV0DIeoyCjOnGp5oUkfYGXM64+QwvS0oZ48PNDmKbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPzEsRMbnQVQLXhpBp0Gdgel7pFOuyddfchCgCGUSRM=;
 b=zLEuHToe/nbvrNRwnGbAOjp4DgEaDBj9PUERzdgn+63yRWqeSHFN58BirPS8yrLe48yR7ok+kYrIAmgKjZSGGlQQxG+VSyI8RDh4V1+5x8+inZZdMKv4bcCyzg6WQ3/mE5hEmKheL1kr4tTtaDPLmkSvJptBJENpLffurpP/iKtrHKl6u150/pgp3LOUPbcVvCe/wDOp14GL+zorlzOJcaUO1CLtHwtjmF/aidP7wXb8suvwbGHpcjixVLrFJ23yHCo9nPe54w/5bCr0J9Ekdd2Ntn76kgsDc97KnqpvBAIu9XV4Ar8g5w1BIoKajAD1trW1AMT01YBAan7AKdl3fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPzEsRMbnQVQLXhpBp0Gdgel7pFOuyddfchCgCGUSRM=;
 b=ZQfq6R4NgpDofOzIDQjP7ofSs9U8m5L0b87hSQUYMAym3iKNTkORVdFdg257ivvdRYFkHh09ZXMx7bZFK/oP3RoDG6FkfPKpmXTpneiZTtkN+at7UgZofj7yYzizoVu/1X3D8SZ88GF9uZRKkmqy0KzS72sJTcYaE3hgdas7eAcKGuIzVnBsNwRcWW2GBQpfxNY1Laeqd/COoF2O+ZFn9HYhIEENvHEA3SuNvQ365jC/nj4AgGDAjiaeXt6KTVft+wm9QGs2WYOqAV2d4XfIrZH8n1v9cKqi+Lv6Tx+Rq1mEXUlMsJ5wC+R+Ick6Ftli6gbCORsLofoG1EMaY9G/Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by VI1PR06MB8902.eurprd06.prod.outlook.com (2603:10a6:800:1dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 09:51:49 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 09:51:48 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Mon, 19 Jan 2026 09:51:28 +0000
Subject: [PATCH v3 2/6] rtc: zynqmp: correct frequency value
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-zynqmp-rtc-updates-v3-2-acd902fdeab1@vaisala.com>
References: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
In-Reply-To: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>, 
 Harini T <harini.t@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768816307; l=910;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=3b3yY5Ig1J+IimHefHjVyESti/NVRS/8WygLbnbciQw=;
 b=0CERSLCq5t7zdWtxt35tDKyDT5sjG+9ByjqmH1fWaqwJujsk+fgHbuMf8Bl8jVv877krUU6Vh
 5ip1lCBHD/ABynqEIKvEQrGNz8kE/sfd0iQ9YP35daTMn3GuM9VZR/s
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF00003827.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:6) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|VI1PR06MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: a26149d1-e2ff-4831-b8e2-08de57405d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVd5U1hXdWgxUElnMmhXTXlQQldWUkp6cTBickRDbjI1WkovVTM4Y3ZEV3h5?=
 =?utf-8?B?ZGNud21tQlRBQzBJdnVZbGNuQnJaK1ZxMzQwNFozZTBKcTF3WjJYalRTanhj?=
 =?utf-8?B?QWdNdHV2Vjl6dm1nemtRa2pLSS9RNFFGRWd2Zm9tVWxoMnV4Z254SC90K0E5?=
 =?utf-8?B?TTQzcVNMZjVWbzNMd2xCQUhXYlBZbVpCcCtlbXNoUkIxaldHNjJwY2h4d0Rp?=
 =?utf-8?B?SGpkZGg5M2dneVE0KzRyOElsNUlTWXUzSDUydFJ3SW5XSFg0UDIxVDcrQWcr?=
 =?utf-8?B?Z2d6eDNXNkpoZjZSUDNKOC9UOHRrVlRwNXF2WllCSFFaWndFcmlMQnZ1QVFa?=
 =?utf-8?B?Q3JXNGZaYy91OFcxQkt4b0xIdTFDN2w4bjlJSTlMQ0Z0LzYrNFZwSmh4TXMz?=
 =?utf-8?B?T1B4WCtYZGlnbkNzLzdESTIwNmxENVRKRFZZa1NDTitqdW5zdGUrTTlmN0pu?=
 =?utf-8?B?THNFZXdhUit1ZlZrVXQ1WGhXRC9qUUhjQ3drQjFkSmVNRS9QSWZ1NjNic1p3?=
 =?utf-8?B?MnBWNTFJUmZXckZTS0gwdERlc2hRUXpRM0tSUzQ0UUtEVVlUOFlQNTVqUWFY?=
 =?utf-8?B?aXVRR2pZRE1mODdXZkxqVDBnN2k4SmsrT045K1FRQnZPZUNOdnNjVUdkSlEv?=
 =?utf-8?B?dmRPZ3ZZTng4OHN0R3Z2aWFUSGlUYWdEaytxVVlVd3JGMFBJYzBubU5xY0hG?=
 =?utf-8?B?b2hac0JUczdRdmY5WnJNcFBSckxxaEZxcit1dk9aczMwV3graEpkWFZOYktX?=
 =?utf-8?B?aW0rUWlXY1VTcHZYanh5MXg2OW85elJQbWFpU3BRa1FHWlh3REJXUG1PZFcx?=
 =?utf-8?B?QVYwMzZwMmVhSWJXUUUzWUFMYnlHdE5KTVhGOXhFeTAxU1VuVDc5ZFkwb0dw?=
 =?utf-8?B?OXk1WlVoTDZVb0k0VnY3OVJSeVFVQmNUQkZhZENuMVpLS3gvb3IzMmJjWU5G?=
 =?utf-8?B?WUIrcUxDaXpCRGVwbkZhWFUrVklKVm1kL0k4bE1zNi94YjY4aXJLOVlBWVda?=
 =?utf-8?B?cldkNytwQUtuYjlTdkdpTnFVL3ZkTzNvNEZhd0sxNHV4VWY4bEZaWGl5TVcv?=
 =?utf-8?B?U25YVEhMOW5DTDlrOEdPSC96S2xiRnRoanRDS3Nva3c4TEwyVldvNUtMRHpS?=
 =?utf-8?B?MDFYYnllSEFOTGYvaFBGYVZpUTBmRm96N21aWWNPZDhPaCtydTNabzZOWE91?=
 =?utf-8?B?YjltNWtrYW55eUs3NnRUUmtUUHI4STJaaGlmc2YwTW9xRi9LU0NmdGcveWdn?=
 =?utf-8?B?czNUcGxwYTNCMTllalZBa3hSZVlCNi9ud2JVRVJIMjV6OGNZMm9UaFhYa2Vo?=
 =?utf-8?B?cjRxelRnVTdnS2liVmo1TmZEdFNTUnprRWlxNnZqYVdYUDdIUHZMMUVpSHhV?=
 =?utf-8?B?aE5MQUVPUVFFMVFuZlpkU1F5VnBpQzlidUtKNERLZFMvZ2c2QnN5blZCb1Fn?=
 =?utf-8?B?dFNmNXFZK0NXZkszcm1qbDFoZll4RGZvUGdrVGJsMVovZi81TUhraVN3RE8x?=
 =?utf-8?B?eEZPWVpsNGFLb2ZuWmIyYVZyVC8wa3RCMWZhUENtN1R2S2ZPenZEY1l6OHda?=
 =?utf-8?B?NlM0MFNFR1ljV1dGbGIxeFRKSDJrYUNmYk5hNS93R3o0VW8vNHgweW1ZcjJn?=
 =?utf-8?B?YWNxc0FJZ3FZT3ZHWmVqYUMrdjVuRk1SYUJFVER0d2I3ZDlxamkrR290bUdo?=
 =?utf-8?B?alZPVmUxcTVuYWhpbU0rai9GNTdHc3licnh0T25rUTFNbUxSU2Y4dVo1YVlz?=
 =?utf-8?B?M2w0MmMwWlJWZ0ZCcnlmaVVHZkpWakJsV20zNnYvWDBNMDZYYXNldUc4bUNq?=
 =?utf-8?B?eHFmL2dWTlB6RmcyRDlyOGFVOW5Xd21KQ3diR29OUEdLSnBDdEVhNE9HYW94?=
 =?utf-8?B?bmVIbk1ESEV1MUJOMU1KSlNtVnFYbUhqM3J5UmxtSmlaZUwrTnhLODZoVEVm?=
 =?utf-8?B?a2ZFcjlJU29Dd1ZQOXJFbEpVVUhXcVZGd2Roc29ZNkxhQ0tDQVpqOVQzandJ?=
 =?utf-8?B?UmJ1NUw0WkNFWTJvUkRHM1lKY0hCMjQvWGxrcC8zWTVBeEZ0bTkzaDc5bkdH?=
 =?utf-8?B?Y25OQ0RrUmZOTForRkF2SU9sWmhwRk52TG1JQmtoY1V5dHg2TTR1Y0R4dHFG?=
 =?utf-8?B?SU1mN2hNTHc5ZTRNTzZYVklHUS9Qb2xpUDdXdSt5clhDWWRWVUtJQWlNWWV6?=
 =?utf-8?Q?8dMnvNCjYmpxWM2PPrcQq48=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGNnZHpOSDlDY1l3OHkvN2l4aCs0Ym5jL3RjaTFQcHZROXRPaDFDRGIwVXZX?=
 =?utf-8?B?S1ozVzNYU3l2d3pOdjc3WDdZQU1QNHJyZzdoYzBTZjZOQTRJb0wyc3REZWVa?=
 =?utf-8?B?bU1XTDIvWk05R2VrOHNsVC9LNkJjWktlY05aOFJVdWR3TW1Oc0xWVDBRYnB4?=
 =?utf-8?B?NWpvcHJxSTErMWlIaCtidFcxdGhSSEs2MG9rdXppUUUvZGRNRkNUcktnN3Fj?=
 =?utf-8?B?T2VjM1h0OElYMlB5NEdla0c4RVZGalBNNlJMWkdmai9DK2RleFdBTGd3VVhh?=
 =?utf-8?B?bzdOTm1Pd0VzVTNvang2THNzLytoTHBVTTdKQ3lZQnhiUlpRRnNtVjQ5TDJl?=
 =?utf-8?B?eWUzMXplNUxrSDgvbHg1aS9JSmE3RFFFRkFCc21qemNGZStGN3BCNWEzb28w?=
 =?utf-8?B?ZUZPV3dLcVVQNlNrL2szYnRUcE1KeDhLVlN4R3pCQ2ZQTno3Q09rMmo2eUIz?=
 =?utf-8?B?SU9MQWpuNDZCZzJXV3JWeHgvQ2gycmk4Tmh0eDdqUCtET2cvWnMxVFQ0TnVY?=
 =?utf-8?B?U09LSFJvNmNXZy85Q2h1aWZDcmpTQ0x3ZnVIZlJPT0dxVXBJYnpWSHJXYzc4?=
 =?utf-8?B?a2tvUVdsUFRIbnpycndmbmQ4b3lpZHFDVk4rNW01QUNKQ1RtUjdSM3BnQjlB?=
 =?utf-8?B?TmhUSVovTGRRSS9OZGI3VVJ2cHlWTHZ6dlh3TmN3VkxTNU9pMmtTVXBnU3Vj?=
 =?utf-8?B?QjM0WjVrTTdGWElXZkJWZ0s5ai9TTXpXZVE0MTNHM2FFS3ZSUm9aTldZUzNI?=
 =?utf-8?B?aGJRcy9Jd1ZiRWdQdFNSRENKTUd4cTNtSTZ4bDA5c3VUd0JaSXIyTmJ3ZERs?=
 =?utf-8?B?M2ZrdVFQUUh4M1VnQzU3RUxsaEg0RlNYZ1ZlcXZYWUcxZVNmVFN0RWNLTVdN?=
 =?utf-8?B?ZG1qOXRjTEJUL3lXNXo1c3l4ZFVVOXAwN3VULzRVUU53MERXVm1BM1JndGxv?=
 =?utf-8?B?ZlZzT2pCWkRRRExxTTRodXZZMjN4dkgrcTFJTWdQK1QxYWlzWWxuVzNCcmlX?=
 =?utf-8?B?Z0tydXFyRDgweW0xNGgxQzJHbFBkcGFGL1hpY29KSUFrdTNMeGVXVGNXV3lH?=
 =?utf-8?B?MmNDSlVrSmwyU3pUWnRzcHVqNmlHbitQd1IvQUhmSXlCWDZGRHNmd1ovK3Nv?=
 =?utf-8?B?MjU3WkpFVWMxanV0cjNsaDFEd25uZ201aGF6ZFVHSjBPeTdzaDQ2S3hYMlpF?=
 =?utf-8?B?NitDK1pNWGdETEhUSER3LzJabzUzQjN5ejg0SFBQWUtSb3pUdEVsNGVRZlg0?=
 =?utf-8?B?Z2VOdkNRZFVCVFRwUS9YaStWQ3ZyZmNuNUFvNTJKVjhnMkhPRVRVeC9QdkRX?=
 =?utf-8?B?d09zbW5PZFZJNTJiY0NuemM0YVZPTTJuRkFZNjhqUFhxbW5zVDJOcWFCZFlh?=
 =?utf-8?B?QjNmMXVDTituY1dOL2VkM2wzTk1PT0FTemZ4ZnpsL3laM3hGR3hxdjJVYXhJ?=
 =?utf-8?B?d1hZOUcrOW9QTG5NNXJlbDJwdkpOOFNPT25OeUFsbjB2OU9od2JIV044UDdU?=
 =?utf-8?B?c0dIV2R0Y0RROUZCTzlpcHBEOFA2dVM4WmpRTmRjeXJxb2k0bTI3T2JGWExJ?=
 =?utf-8?B?bEhEQmFBYjRBdUJjZEJWRy9oMEg1L0FVSnlvSlZiS2NCbWZEY2xqY0l1aXgv?=
 =?utf-8?B?YXVBaG13eGJDUXRlZjVCT0taeG5ZNkNDS2c1MVFSRndYSkd0UEFqak1ETG5h?=
 =?utf-8?B?QXowZU1pNUdBK2Z0L2YzcWJKNWxNTDBrdElQRm8zZ056MnJQVmhidEE0LzI1?=
 =?utf-8?B?bzJpdEVqRzEwNnlHMlI3cWx6L09IMVJ1WGRwRUJmQ3M5T2RQOU1UbzZJaTBR?=
 =?utf-8?B?c3JQN1hNMTMxL1QxNG52Sk5BT2VCSFBJYW9oY1BXMDZXSFBzRGRRamtXU204?=
 =?utf-8?B?Yk5lWEwwalNTVExGNGN1NHRHUEIycmZWc2lSOXJLKzZpc3c2L3Z1UDgwWGRO?=
 =?utf-8?B?YzF0elJpVWwyWFJvNVg5SFhVSGVpdlNvZEFJdXNJN0FZVzUwSlVLMUo4Rkhp?=
 =?utf-8?B?MEpjSjIyMklFNGxtQXkzMDlQVmczRENpZUpsRXg1UVJPVVU4MzMvajhhUnda?=
 =?utf-8?B?MHVMZG9ydUsvTHNJcGJzQXJieVBtSC9kMkRGU2gvNG40UXVTOHd3MzVCQmlT?=
 =?utf-8?B?aUtTYU90d0RTa3FJbDY4UXN6b1BJQjNLdXJ0RDg1RTZwYXpORFFjOW1ZQlNn?=
 =?utf-8?B?ZXR3Vnp2TGFvRlYwaENHS2g5VUpodHYxV2pydVhxUU96QTRsckk2Tkptdi9V?=
 =?utf-8?B?WlRKaFpSOHd6T01yQjRoeGo4Qm9nRDVGbEw0VnFFOGtXdnpBZStPbVVpZGZ2?=
 =?utf-8?B?NUxEWkM1TkhoRHRobWczWlN2cmQra2RQRlFJazhmYUhBWjBtRERxd2I1TFIr?=
 =?utf-8?Q?41GPG0JPL/b8mU1I=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a26149d1-e2ff-4831-b8e2-08de57405d4f
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:51:48.9325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4zYtnwJElms7gQNMyG4Btot2zjWSJhQRFquEXKTHevdLE17SdWUBvYEUE2+wN9diwGRQklhp3txQUVw1NiDZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8902

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


