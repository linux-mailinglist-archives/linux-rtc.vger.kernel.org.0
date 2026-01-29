Return-Path: <linux-rtc+bounces-5908-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKrBF4vxemk+AAIAu9opvQ
	(envelope-from <linux-rtc+bounces-5908-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 06:35:07 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0315ABF22
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 06:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61DFC300E70C
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 05:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4A12DC79B;
	Thu, 29 Jan 2026 05:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JTSNPArW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00F917BCA;
	Thu, 29 Jan 2026 05:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769664904; cv=fail; b=BV4s5acIlXnBFZYTgTezrvMvpVHa/HPUYMeXMF2r/Zsy8CG0KjzoOtHlf52b2YpLhWYGO4X3wc78hBLj/OSVpfTbor2i68ceMSvbUlTM0q9hDodLRRXgf9/chCENi1aLNIH8gZtNd7H/qUtala6st8YxUq2B5kK2ePQhiP5Z2VU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769664904; c=relaxed/simple;
	bh=KUIld0XYMJdCQd8zc5qlONoJ5kU2X1qzsk2E0eFgs5c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jpdUIN+NfbIOP9fUKY5uJoD8YW+jpGeXw3YZOD/k/Bhjf3OCuvGPQP1xUxNJ1fZPoGMJtlgkt3up8Tfhf5J54iX6CuNV3jqWWFAyZLelkGxkWVdwCTFWBlvTcMALTVHHFNojUhOO7SUW5mjWnwYtRAd0NhFzE8gOQ97uCj5yqIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JTSNPArW; arc=fail smtp.client-ip=40.107.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olK5xiB5hT42hsuhbmr/002Jf96lAd9Y7RmbTKtJ33K1VqYnLU3/dyvsvcmD437PW2g59/xozwEe1tZ3xMJpbB6hSC478N52CRyCbnWVJT7AZYMVY6fhs52n4gaB8tvGt6s2laM4geZ3yv0X55p6yn000zvO1BFNo6+m45As1fueLVXHizZ6us6FtH6w2Cn5CFOEOd96qVDaBlFEgFQjrrmczRrIkioFkSk619ScMHvhwUAP3UDJzZzTLHEPkDj02uyRXI7/GE9688jGDbi/Cqr2/IYftIQ4aSGZvLDlzTp0Y+XLY/PcACS9a4F11jfy6kakhl9Nkpee11kBrPLxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUIld0XYMJdCQd8zc5qlONoJ5kU2X1qzsk2E0eFgs5c=;
 b=CCXOuO2Ig3mvEukSKtZTAKCnWdky0WCAKjDa+/yG44esVJG20MWfA7DAciNehaphG3B9FAE6uqwx0CNp9Buwpge0wrhzEa8T0vLQpIbNyCUXZ4mvMuR16tDwyuIaMmzEsG9EoZ8Hu+rnRpcCWUUAeJfaTLNp6vkjuufHIVEqwlN6xqxe8w/R+gAhkYf+ex1xcoVcn7N22WYPeK0n3pSBaWNip/TOUBZJITb0mPlKapayIzCXruus3IRbz8j02edKTBwX35kJKQLU9kJs5icS8TLOAD6vNoxGpdk1qW6cWSRr5G/FBZctfzDrcY+8G5NQ7U69JHHz2PBB2bE4nXBZoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUIld0XYMJdCQd8zc5qlONoJ5kU2X1qzsk2E0eFgs5c=;
 b=JTSNPArWdiLBu/MDiN+SiaKLXEdX5+ePkJReGZ9I2QK07SzTdaGM0CMz2BOTXM7BMSLwwbzklJ3IJ+V2FFtFYKaN4T0NZO6JeEcBWWW7Pg+LuS2rVvWLf6z3QP3NIPYf8Q7eg3ele4dtLKv5X9nL/ZlU7VmpHlbK1qjVPA4JqcANIqdNpEgvfijbo1U3kPEXELL8pWLsi8Y4NauPsfomzvjSV6SxvvSLbkzS8CwYVJPAteqs96cCn8Rp0etmu6ycgTUL+BCkc4hVd0zlW61+yvJPRqHvwDOt2pOqPQoeFWWVVJcYreOoViP2ozG4lahTH/HRWYuN+06uzEJxbSlY+A==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by PAXPR04MB9491.eurprd04.prod.outlook.com (2603:10a6:102:2c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 05:34:58 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::e196:11a8:211:feaa]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::e196:11a8:211:feaa%7]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 05:34:58 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Shashank Rebbapragada
	<shashank.rebbapragada@nxp.com>, Daniel Aguirre <daniel.aguirre@nxp.com>,
	Pankit Garg <pankit.garg@nxp.com>
Subject: RE: [PATCH v7 2/2] rtc: Add NXP PCF85053 driver support
Thread-Topic: [PATCH v7 2/2] rtc: Add NXP PCF85053 driver support
Thread-Index: AQHcX5YU5pUieeS4fkCa5+XGoZ6rvrVpAgwg
Date: Thu, 29 Jan 2026 05:34:58 +0000
Message-ID:
 <AS4PR04MB9362A4D41767614B7B81EA3DFB9EA@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20251127120456.1849177-1-lakshay.piplani@nxp.com>
 <20251127120456.1849177-2-lakshay.piplani@nxp.com>
In-Reply-To: <20251127120456.1849177-2-lakshay.piplani@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|PAXPR04MB9491:EE_
x-ms-office365-filtering-correlation-id: f17945d6-58b2-4094-574a-08de5ef8243d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?OHozWFd3Y1hNcnBLaUNVengvMEZPdnh1RHRLNE1QUU9STS9SUHNOUjB3QVZC?=
 =?utf-8?B?SnlaVVpWZityUi9YUC9JMTIyWUNKV1piMHlLVW5QMEhSWHZvZkhEamVod3VN?=
 =?utf-8?B?a0l3LytwblZzdWJERFkvbDFybXJqTnp2NXlqb3ZOb202VE4rbVVYLzNzS3Zm?=
 =?utf-8?B?bmUxVGExaDZtYkErZGFJaGhUZXJDU3RHZm9mMFRXUGVMLzVIaHJsdjRpcVdh?=
 =?utf-8?B?bjgxNmJGV3Nvd1EzQzd4MlBMMmdxdmJiODJGZk9mbUdwRGtZTTI2SlowaGxI?=
 =?utf-8?B?cTlFQ01oYUFsY2tjcFFTRkVHWGwxdU02SFBDYW5vbDZZWi83cjRCRThqUHVx?=
 =?utf-8?B?aUJjUkF6VzJaRXIxQS9zN2h1cVRuSkVDUlVDQXEvVEN6SkdnL252VjBaeWpT?=
 =?utf-8?B?TDZ6d1pyb2VSZG1Qdk9jU01jTmdsMDg4ZkxOeUNKWFVBZFBFbTF4SlJOdnRz?=
 =?utf-8?B?QjJJTnVFNmh6OTR1aWovRGViSGcxSG1PakVZelFIUWphNzVud1NQMlBYWmtH?=
 =?utf-8?B?QkV4WmNYYTBPdHRVaHNCUkxVdXh4d2xKeEU0UWpkY0Y3bXJjQ2UxTkViWUdz?=
 =?utf-8?B?ZVdsb0tFL3VjWGpTQjA5Q2J2UXhYdjFmdWNxQkdCOG40QjhuNlBWNi9JaGdH?=
 =?utf-8?B?VW01UHdETjVFelltRi81NWxZeUV4eHRpWGZNbElNRnhEb3kwZWtWYVJoV3Mw?=
 =?utf-8?B?VVRaN0t0Sk1nSGtnMzZlc0pCVm52aDU0M2pubGV2eUVjcFhZODh4eG0zekFo?=
 =?utf-8?B?eUNlaGZyRjZEMTBQOC9Gb0dOcmkyOXZNR2RTdUlROVdrRVhVZWd0UmN2ZVAv?=
 =?utf-8?B?S0NtQStoUHNKa01rOExlZjMycFdvdmJPWEFLcDJGSkdPZ0dXdFptNFJMNVFL?=
 =?utf-8?B?YWxlWjF1VlJRbGtPcjYrbVRJdTE5WXdWQWltMXVkUmFkMjlYYkw3TVdDYmdU?=
 =?utf-8?B?azdiT0JGTy9peFZkYSsrYnE3S080OWIxTkpzMkoxSW5RN1pPRWtCN3pZa2FU?=
 =?utf-8?B?a2V5dUttZ3JyR0U1Rzc2OTNhc0pTZ21vSjFMWTBXQ2c4UDVmWWFSZ1RWbWZT?=
 =?utf-8?B?N1FWaTVNalBaWWZ0MUJackRZemJRMGJUOXFCZEsrSkoxRHBwYlgxRUo0ckJ3?=
 =?utf-8?B?dVBVNXNHeHBvVlpjcXFXSTBYb05RbEpNd2RFRitKcnVTSlhrelFuUEdVaUFh?=
 =?utf-8?B?eU00NWliYTBZQlFUaXVIcW16Ri9kaUhVeXFXYld6SktRZVVCZ2xwYW43OHd3?=
 =?utf-8?B?UXdHOUdWdnlkSDZlalBidzA4VVZaY0hkNVRqb3VpS01NTUdTQ1ArNGwvMjBE?=
 =?utf-8?B?dEkzOTVOOUIzVU1UK2s5YURUcndqRk1zcXFvTTBDNTkyb251c0pCZjNrcEdG?=
 =?utf-8?B?TDRFc1FnZ0J3T3A1b1Ftc1Z4U0dEcGdpU2lsYjBtNitYYVordGtXSUErMDRQ?=
 =?utf-8?B?YTBLVjJWckd1ZzhLa0c4T05rV1ZoOWxXTjJoZG1SOVIrc3B4RmJ3b3BmbGUy?=
 =?utf-8?B?SmpDZlNHU2pQTHgxYS9IaElhV0NWclE5aEwySnI2MTVwcGJrbmRXR0pPTVNm?=
 =?utf-8?B?MHZuVzA0RmVIa3NndHVYRzBNNGJRSkNkNTNBd25KZlRwQXNPbHNPWTVvaFAy?=
 =?utf-8?B?QVEzNERxNHhzYjRzbk15VXJvOWg3MzlmaHdqcEdXcm9sT1FicTVES0RRMXdY?=
 =?utf-8?B?WW9wd29VNUhJanNuZVNoUlZkeWZWcFJHKzY1UFRsejFqL1FRY3V2NHEzVWdQ?=
 =?utf-8?B?bURSSjM5WmZuWVllWEFYaHNRRWxEN3M5b1dDaHVCaHRNS0tlcFViYzJQZ3Rp?=
 =?utf-8?B?Vkt0UENnZFpyTDY4K3l5N2VQYlJZNndzVnovckFMaGM0NDRQNXRYRWZENDhW?=
 =?utf-8?B?VEdjVG1ienkxaVNJRy8vNjJYNjlJbldiZ1JVaEVEY3dvaUVSL3U5QUxRVmhm?=
 =?utf-8?B?MFlYYVozWFV4SFM5KzFpOEZZUytMYkhEVFBlMkxVVWxkczJkZTg1MDl5ZU5o?=
 =?utf-8?B?Y1pvSk0vZ2FLeVV1YjBBYWxGak9VbFBZL04rTjgwUmwxeWtBVS9ZR3VwOUEv?=
 =?utf-8?B?aXUrRnJYNTg3NllXYSs3ZVZVSUFMdDZSVDA3SGYyM3pTT2lhSWJKTnpKcG81?=
 =?utf-8?B?bmVURExlYVAyclk3M20yWCs1dDFiQThQaG9UaUN5T2FYeFdQaENtOTZIK1NS?=
 =?utf-8?Q?d3rVHyJHOG/TguS8B/tB73k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjBHR3NISExEMkFUS0t2WURGTVRBQXd5THJHOWhOMm90eElrVUs1ZWxkdGl2?=
 =?utf-8?B?TlRnYXpsQ21PbjFRTm1YUzhab0IxaU1oK2xWTmxleldLTy81b0dJQXZHeXRX?=
 =?utf-8?B?SHB1R0k1OTg0cW5wUHZzT2NKNWtadGRic00vNjNzN3lNUC9jUnU5RlZHNDJX?=
 =?utf-8?B?a203TmVYNldBOEx6ZUh1cU9lUStxREdxRkt4NjBoY1ZLRnRidjBQZGwzRVN3?=
 =?utf-8?B?bEtGODZTZHJFa1daM1VEM3dNdUdleTJXbEF2Sk5sWnprNlNOTG9OeldULzk1?=
 =?utf-8?B?OUJEZnZkQis1S0x5M3I0Q0t5TklzZ0Q3OEVYZjE0YVl1ZXVHOW5hQWxiRVE4?=
 =?utf-8?B?UytnTXhESjVVeGlQRk94UUtiak1KWGRTaXRtUm9vYzd3S3ZXYThvNHNUQUtW?=
 =?utf-8?B?TlNVc0szam01ektLdURsNjkvK0R2VUZVbGVkaUQ2cjFxOVUzQXFTU3ByNXlX?=
 =?utf-8?B?Tll6ZnN2VWdrd08zd1JyWlB6dFcvMWZYSmNYSDNwK1p1MjNjb3ljMEw5Vkdy?=
 =?utf-8?B?eXRPUWNERlJqcGtvS2pnbTJWN0FXMjFMNVl4VjBWUTRvRHVGWWlhUy9UUnpo?=
 =?utf-8?B?ZE8yT3NkblVOU2NjOWhFN0hLSGFCM2xZajdlZDB4bFlFaGpzZkRLSHZ6U0FP?=
 =?utf-8?B?VndxMk51aDZySll2T25KWkdRZ00yVjcyZ1NLWGlZSVVvNlU3SUdWUGRjNUhv?=
 =?utf-8?B?RzRiNnZlZEg5cmpkeWpoM2ZQSUM2MzNrZ09CQ3VyTzF6OUs1UTRHVXQ1MldW?=
 =?utf-8?B?MEcwZDVydVM5ZkUzNGI0RkM4Uk1BTk9VZzlVOU1GU1pBRk90akE4YlRPQmxk?=
 =?utf-8?B?WHhjNzZyZzMrQ2xRclB4ZWdHZEhvMXN3K0k2a2s3Q3JjOG83V1V1Q291eE92?=
 =?utf-8?B?Yy9HYkNiR3FtU2tkMUhGV1IwSHZWS1d1ZG5nVW9oUXF6QUFiQUdOdU1PN0c4?=
 =?utf-8?B?a2Z3T0NVZ09uYXhxNi9UY29ubFNQdmFDRmV6NHZQakVMbTRlU1RJeCtOTFZX?=
 =?utf-8?B?Qk9jUGxZUEVpSVVmOTk2SGVSby9GYWFoN3piZ3lIL1R2cXpIMkREQUFjbVc3?=
 =?utf-8?B?ZDFmT0d6UDh5Sm1lRmNEMTBKUTcwNkl1WTR3ektqVzFGRlE5MDQrUmREdkpi?=
 =?utf-8?B?T1oxTDFYWi9xRGEzN3RsMGIzSDI5ZkY0N3hBZHdmbW9JQkZDa1dNOEhLdHQ5?=
 =?utf-8?B?dmV6TTZYaWppUFBYb0tDNmlyVzI2bkFpUmhSeXhUK3VrV0lJY0poNVYwNUV4?=
 =?utf-8?B?dGtDTmYzRHdvejBiU3JWajI5RjVyUzBOb3NldEI1VnRhUkppWFVXSnY2UGM4?=
 =?utf-8?B?d3VFTkpHWE9YYThtSUdYa0g1d0dWd1VWOVZ3aTY4MWVPOFFtTXR5czIyMEhp?=
 =?utf-8?B?c3lmZ09qOFlJUzJCbkVGUWxsT2Jsbzd4RzZLeU9oRjdWWkxTMnN4OE5WUkJE?=
 =?utf-8?B?KzlFV0ZWaUo2NWZIMnlad09tUmlySktsSEp3QVBuNHVKSWVVUkJMRndrcm5Z?=
 =?utf-8?B?VzdSRXJxSGZxM000cjFqOGFxNytMTGpSaXp0dUdHUm9pVnZRSmZOOG41VGVK?=
 =?utf-8?B?YWdZTFYrNTQrWlVEdlhVbnlHM0EyU3FDbU1mSWx6RzhHQzZ0Zm13aUc5YXln?=
 =?utf-8?B?ZGZ6eWdDWTlGM3ZISGNnbGVXSUVaNVh5ajBBVWc1T2hBZ1ZnakpqNkYzZkpT?=
 =?utf-8?B?QVl6VFNFVkNaODliNjRvd1NTbk85eFF5ckZOaS9tcEpVNjg3eTdIcktFaWhU?=
 =?utf-8?B?cTJxeGg5V0JlTnFhbVhTUWlMRWVqbDEwVVNyQVFoVUh6ZU1SRUFWOVhZZVZX?=
 =?utf-8?B?THBZQXhIN3BZZ1crNW9udGNkMjdBWVo1QTFpaU8wODBzOGk2dU5MbDRuU1ZC?=
 =?utf-8?B?LzFGSCtCWURkWEhBcVFBUjRtK0ZMczRlRHBEUTBIQ0tzazFTZm5DUFFtem15?=
 =?utf-8?B?aW5GWlNLMFZKNDVRSldzSnpydFFndU1IZDdrUjB2dkFvTlZBSmkzN0xGWE12?=
 =?utf-8?B?MnQreFBHRWZLVFI3RzhxQ25WYnVPSW9LeiszdlJhc3gzOGh1aEZJZTVPVzgy?=
 =?utf-8?B?YWZ0MVhPOXJ5R1RNaEtvbXdtRm0xUUYzdEljMy9PRURyaEwvZnE1OHJZUVF3?=
 =?utf-8?B?enZrVjdJV3dMeHg4bFB3ZDdxcng4aElnOFlMaHN4MHJJQU5iTHNOWWQvYkE0?=
 =?utf-8?B?enBoeDVXUjd2MjBFbWhDbC8xdlZNY0hEOGpxK2dMSnRrN29QczNackUydldZ?=
 =?utf-8?B?bDQ3clczcnJFOEdISFltZ3ROdGxRRHVLcm5RNTV2UTBrVTJON2hVYU1tQnFO?=
 =?utf-8?B?cFRVd0lUQWRTaVNGNytRSEVSS1BwZmMwNmNRem5UeTFXSzhnejFLQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17945d6-58b2-4094-574a-08de5ef8243d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 05:34:58.5536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DzqzZbDZoJtkoOdmyx9mjg3CWCJl7DzuYoKZ1DxxKYpN2Ov65ZA5nnduOxW2tUf92SV7y3o1QUh/1SCvn7vQmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9491
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5908-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0315ABF22
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFrc2hheSBQaXBsYW5p
IDxsYWtzaGF5LnBpcGxhbmlAbnhwLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDI3
LCAyMDI1IDU6MzUgUE0NCj4gVG86IGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tOyBsaW51
eC1ydGNAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsg
cm9iaEBrZXJuZWwub3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7DQo+IGNvbm9yK2R0QGtlcm5lbC5v
cmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBWaWthc2ggQmFuc2FsIDx2aWth
c2guYmFuc2FsQG54cC5jb20+OyBQcml5YW5rYSBKYWluDQo+IDxwcml5YW5rYS5qYWluQG54cC5j
b20+OyBTaGFzaGFuayBSZWJiYXByYWdhZGENCj4gPHNoYXNoYW5rLnJlYmJhcHJhZ2FkYUBueHAu
Y29tPjsgTGFrc2hheSBQaXBsYW5pDQo+IDxsYWtzaGF5LnBpcGxhbmlAbnhwLmNvbT47IERhbmll
bCBBZ3VpcnJlIDxkYW5pZWwuYWd1aXJyZUBueHAuY29tPjsNCj4gUGFua2l0IEdhcmcgPHBhbmtp
dC5nYXJnQG54cC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2NyAyLzJdIHJ0YzogQWRkIE5YUCBQ
Q0Y4NTA1MyBkcml2ZXIgc3VwcG9ydA0KPiANCj4gUENGODUwNTMgaXMgaTJjIGJhc2VkIFJUQyB3
aGljaCBzdXBwb3J0cyB0aW1lciBhbmQgY2FsZW5kYXIgZnVuY3Rpb25hbGl0eS4NCj4gDQo+IEZl
YXR1cmVzIHN1cHBvcnRlZDoNCj4gMS4gUmVhZC9Xcml0ZSB0aW1lDQo+IDIuIEdldC9TZXQgQWxh
cm0NCj4gMy4gV2FrZXVwIFNvdXJjZQ0KPiA0LiBHZW5lcmF0ZSB1cCB0byAzMjc2OEh6IGNsb2Nr
IG91dHB1dA0KPiA1LiBQcmltYXJ5L1NlY29uZGFyeSBpMmMgYnVzDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgQWd1aXJyZSA8ZGFuaWVsLmFndWlycmVAbnhwLmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogUGFua2l0IEdhcmcgPHBhbmtpdC5nYXJnQG54cC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IExha3NoYXkgUGlwbGFuaSA8bGFrc2hheS5waXBsYW5pQG54cC5jb20+DQo+IC0tLQ0KPiBWNiAt
PiBWNzogLSBBZGRyZXNzZWQgbWlub3IgY2xlYW51cHMgZnJvbSByZXZpZXc6IHVzZQ0KPiBkZXZf
Z2V0X2RydmRhdGEoKS9kZXZfc2V0X2RydmRhdGEoKQ0KPiAJICAgIGNvbnNpc3RlbnRseSwgZml4
IGFsYXJtIElSUSBkZXZfaWQgaGFuZGxpbmcsIGFuZCBzd2l0Y2ggdG8NCj4gZGV2bV9kZXZpY2Vf
aW5pdF93YWtldXAoKS4NCj4gCSAgLSBTaW1wbGlmaWVkIHRpbWUvYWxhcm0gcHJvZ3JhbW1pbmcg
YnkgZm9yY2luZyAyNGggKyBiaW5hcnkgbW9kZQ0KPiBpbiBoYXJkd2FyZSwNCj4gCSAgICBkcm9w
cGluZyBjb21wbGV4IDEyaC9CQ0QgaGFuZGxpbmcgaW4gc2V0dGVycy4NCj4gCSAgLSBEb2N1bWVu
dGVkIHRoZSAyMDAw4oCTMjA5OSBzdXBwb3J0ZWQgeWVhciByYW5nZSwgZXhwbGFpbmluZyBob3cN
Cj4gdGhlIDAw4oCTOTkgeWVhcg0KPiAJICAgIHJlZ2lzdGVyIG1hcHMgdG8gbGVhcC15ZWFyIGJl
aGF2aW9yIGluIHRoZSBkZXZpY2UuDQo+IFY1IC0+IFY2OiBubyBjaGFuZ2VzDQo+IFY0IC0+IFY1
OiBubyBjaGFuZ2VzDQo+IFYzIC0+IFY0OiAtIEhhbmRsZSBtdWx0aS1ob3N0IG93bmVyc2hpcCBl
eHBsaWNpdGx5IHVzaW5nIHByaW1hcnkvc2Vjb25kYXJ5DQo+IGJ1cyBoYWRsaW5nLg0KPiAgICAg
ICAgICAgLSBQcm9iZSBubyBsb25nZXIgY2hhbmdlcyBhbnkgQ1RSTCBiaXRzIHVuY29uZGl0aW9u
YWxseSBhbmQgZG8gbm90DQo+IGNsZWFyIFNUL0FGL09GDQo+ICAgICAgICAgICAgIGF2b2lkaW5n
IGxvc3QgaW50ZXJydXB0cyBvciBzaWxlbnQgbW9kZSBjaGFuZ2VzLg0KPiAgICAgICAgICAgLSBS
ZWFkL1NldCB0aW1lICYgYWxhcm0gbm93IHJlc3BlY3QgSEYoMTIvMjRoKSBhbmQgRE0oQkNEL0JJ
TikNCj4gY29udmVydGluZw0KPiAgICAgICAgICAgICBob3VyIGZpZWxkcyBjb3JyZWN0bHkgZm9y
IGFsbCBjb21iaW5hdGlvbnMuDQo+ICAgICAgICAgICAtIE1pbm9yIGNoYW5nZXM6IGRyb3Agbm9p
c3kgd2FybmluZ3MsIHRpZHkgZXJyb3IgcGF0aHMvY29tbWVudHMuDQo+IFYyIC0+IFYzOiBBZGQg
TUFJTlRBSU5FUlMgZmlsZSBjaGFuZ2VzIHRvIHRoaXMgcGF0Y2gNCj4gVjEgLT4gVjI6IG5vIGNo
YW5nZXMNCj4gDQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICB8ICAgNyArDQo+ICBkcml2
ZXJzL3J0Yy9LY29uZmlnICAgICAgICB8ICAxMCArDQo+ICBkcml2ZXJzL3J0Yy9NYWtlZmlsZSAg
ICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL3J0Yy9ydGMtcGNmODUwNTMuYyB8IDcxNyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDczNSBp
bnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ydGMvcnRjLXBjZjg1
MDUzLmMNCj4gDQoNCkhpIEFsZXhhbmRyZSwNCg0KSSdtIHNlbmRpbmcgYSBnZW50bGUgcmVtaW5k
ZXIgcmVnYXJkaW5nIHRoZSBwYXRjaGVzIHRoYXQgSSBzdWJtaXR0ZWQgaW4gTm92ZW1iZXIuIA0K
SSBoYXZlbid0IHJlY2VpdmVkIGFueSByZXZpZXcgY29tbWVudHMgeWV0LCBzbyBJ4oCZZCByZWFs
bHkgYXBwcmVjaWF0ZSBpdCBpZiB5b3UgY291bGQgaGF2ZSBhIGxvb2sgd2hlbmV2ZXIgeW91IGhh
dmUgc29tZSB0aW1lLg0KDQpCZXN0IFJlZ2FyZHMNCkxha3NoYXkgUGlwbGFuaQ0K

