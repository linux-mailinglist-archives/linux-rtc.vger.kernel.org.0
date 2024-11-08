Return-Path: <linux-rtc+bounces-2470-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 359CF9C161C
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2024 06:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88D22B24461
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2024 05:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194721C3F0B;
	Fri,  8 Nov 2024 05:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Lh1K9z64"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2105.outbound.protection.outlook.com [40.107.255.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9E77464;
	Fri,  8 Nov 2024 05:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731044866; cv=fail; b=Wokyon2VId3O7aPsUab+MkEnaezJeFO37/uvWKS+h0aMtvn37siXj0qInPQpxGkdJsjxLjA0YnNRRPT0AKRzlrAYsiA6wAuHUsfWeOExb0yegeWmqweheHbdd1N/7UDODd5kVKLCqipigBsz7ia3Yo2xvnPD1LOtnXl8Z0lW+TA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731044866; c=relaxed/simple;
	bh=Q5dQJWKu2ZgulxnMpGizs/VzJrpG29BCupPJiHTnzNM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cRX44eFfEnKYJ55tDj3gIG1Paoa/9IetdisoghqAm1dbRPKrg0GBxjTgLKR3eVUYMNKodiQRJ1HBDOVVy3xqp++nwl5s9z/oY8z8dWX7juiZnA64YBTecqMbp1IsPb9z/PB5bz23u380IqEnCzzpejM8CaKDuF6LBmWnZFwGkXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Lh1K9z64; arc=fail smtp.client-ip=40.107.255.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4O+U0JSd2PdO8hdB3bbEY/zUumb1sLL0pNqP9hmKaVR8y8ft4x5fDuNqde/YC65IdUkaMsyCU76SWO/QcMoEVJsEXbpy7gYUqPA3HKtiQqnIgFvtnhwwtgbwc36Uux0mMGKG9kiemZyvluEqzB2F6CG8P0i2qgtnNikg1xC9xdnGG/aVY3FKz/FtQ+4HLXtzlPR012adUKRL1zF0i8chlKrJKXVNip2dQ5nOYtIGeCc0etulOVxgbMiiijoFPer+7+c1PZJj/IPKl+Ku3lP9wQP08YgYOjBpMxFsgdqInemRdHgnd+aIhb/HH0xgbDQl/SVYb9RblV2Io0sABx4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8mXPP41I+qO/E03hhkdsfZLWaUpAyZPM1tjAfgEyKk=;
 b=LyhjL+uxn9B38cY+VMBJnfDovcZZs2+hDEXUMyQjJUujN/4r5c8jSrZkcBOD0i2jqCa1Ph6BxKjGdLQVg6YyDc6m3Ap/O10gvd2tL1TRFP5Pu7+cNtKrEyzICNjn/7qmkq13hkJT8DLCd1PBJqjSXVNzJ2L2MU4pW/OiHMtjuaDqYCyGOncpDpqExfnYsjHQ88AtD4LzAu9N9MIz94fqSjvsVu3SLxg0ISvfwsL9lR0QvGcO+w5ur+7xj00mgn81UuMZHPsDfgmy4PGcgSvrYiCEgLVoaV08r4C/I1eSHEv9L9yHlFPRO1AGW8AjJaO5cgo3r1HG5/3nD8cE3fnXtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8mXPP41I+qO/E03hhkdsfZLWaUpAyZPM1tjAfgEyKk=;
 b=Lh1K9z640ZnbsGzcDOxa2gxtmY+ozUWKXNHlBHKm/XVUON+Q879CsERkYV0FLXvOmcaDuQ7y9fSEBr+BFG8hBDfKT8JS3Om5l+dUoQS+Tocf6JhSiHterE/56GSHt8Cy3ZSxu6dqctI0/r+fX0bDWVQ4RaF26dPcxXm07qaVfapNbixD9AzauP4WX9waxOITXXymKPj+RI5bFNvoUIVE0dWyYMVh3fWs7eZdUNmTtEKNJntyu/xkDp2v981+TDU7vX/bKJNynQjTfyAvdxbW+zaAZjdDVV0yMNvXsUS4KOnmiebVT3ck9S8OOocr7iFgLWkCIZLLBiAmeFIrNXZHiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYUPR03MB7163.apcprd03.prod.outlook.com (2603:1096:400:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Fri, 8 Nov
 2024 05:47:39 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%5]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 05:47:39 +0000
Message-ID: <7c24377d-a02f-4488-be7b-0725d559994d@amlogic.com>
Date: Fri, 8 Nov 2024 13:47:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 2/3] rtc: support for the Amlogic on-chip RTC
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yiting Deng <yiting.deng@amlogic.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20241101-rtc-v4-0-14e1ed486ed8@amlogic.com>
 <20241101-rtc-v4-2-14e1ed486ed8@amlogic.com>
 <7eaaa765-d6ed-4afb-8ea3-35bec91c667e@wanadoo.fr>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <7eaaa765-d6ed-4afb-8ea3-35bec91c667e@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYUPR03MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: b7247624-6959-4f47-ab62-08dcffb8dac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEQzNjNSU2xqTDFyaFNaZVhHOXlPWHlLaDVZcVpiSXhsUGRpdStFZHhLMm9i?=
 =?utf-8?B?N2lOWUZrRlhnNzFSS0RiZkQ3M1Bkb3RSNGhWZDBETExCM08ySlRoQTJSaHps?=
 =?utf-8?B?azVoV0svR1JiNmdGM0hFS1VxSFRQTUtNS2p2YjdaMmdEU1h6UWFjc0lKSmRE?=
 =?utf-8?B?SmIxMWRGNTYzWFNpS3hXZEVmTVlzS1VQamd6a1A5QzI3aDh1SmtMYjRpZFpL?=
 =?utf-8?B?UjdwU0x6Z3NmcjdCZHd1K093MFVFalVMTWNCS3lwTkFMK2hWUVM5V2s2K0VH?=
 =?utf-8?B?Rml1RW9sMU5iQlhaQXZPN09Oa1l2WEFUcyt6VG9xY1gyQUkxdW9SR01qVFUv?=
 =?utf-8?B?S1psVFdhK2VYeEtCSEU4VVNSVi9tbWxhblBmVXluanJqM0FPazVXekJWZEZi?=
 =?utf-8?B?WTZOWUR4SE9LQlN1Ni94em5CRWY4UDNZbHMvUnk5ZG1KZnM3bkc5WmdjTThG?=
 =?utf-8?B?WVd1ZzViWlJFRGN1MXZlcnFSTjVvY2k3cC9OR2JiS1BxYkdzK3dXVjg5Zi9L?=
 =?utf-8?B?V0pra1BCRU1Za0VaRDN3UzNOdGE5K3VpeG9NNnJ2UGFsRit6TzQ2aU05Njdq?=
 =?utf-8?B?MGRGbHoraWs1NGNydlZaZTBaVWdHOTFXK3Y3V2xPTFZlYjYyZG9ISzY2SzZR?=
 =?utf-8?B?dzBRa0RIK2ZEM01vNThieE5rdVZ1UWFrTVFCamw1akM1T2JKMHF2bVhhRVcw?=
 =?utf-8?B?aHBrOXVGWGhqMExNNEJ0YVJJQnVhbE44d3pZVHVqdmZTc202bG16V1hObWRh?=
 =?utf-8?B?S3ZjWWZQZ1E5dlpSQ0dsSm41MEdORU84cG1VclprV3U1cWg0S1lvc1NrU0N5?=
 =?utf-8?B?Z0VIVGlCVEgyTlU2MkJVY0JrR0ljQ3V2dzg2NnJCa3o2ZVloNVZkdUZnN0lk?=
 =?utf-8?B?ZWhDbzh0aEVzQVFCeG1pM0Rob3RxZHRLNlNBYnZCUUMwK0tUZDVPb1hteXcv?=
 =?utf-8?B?V1FFdUdxaVFYaS96WjJ6VXpzaUlEUHZRaVlBZTFhc3Y5SUgyclE0SE8yL21N?=
 =?utf-8?B?VllxZFVwV3dOQjlpTkN0dVdIUjBoWHZVdFMzdjBPQ2RIRVlXQThQTm5ocXdq?=
 =?utf-8?B?THVseFVOYW1pR0NFRzNRZlAvWEloWEVuRVRPYkNRNkQrUFRiNU5jdGF0UE9D?=
 =?utf-8?B?UDBTWWJhZUJuQzMvQ0NzenNyVGdTU1FXNzMyKzkyZER3VHlPQld1NUIxckhh?=
 =?utf-8?B?U280UUJlQTJmd3VOOC9MU1liWW9PUjZOemppNEo5MkpiVlMvZXZ3ekprUXNa?=
 =?utf-8?B?UEJiL2w1M3FxeHJMVDlUZXVBSGtiNUxNbytSUFhVSVFXbXVoeUxUVmhqU2t5?=
 =?utf-8?B?eUZlOXArSW5FTUttbnNkVzVickdQZUlTRFF5aVRrcXZQYjFYUGRsRzUxbTNZ?=
 =?utf-8?B?dUtGTXdhZTcybi9UalExTnRWOWZNMTZOS09FZ082UEJPeHJnNENSVU5uRGRw?=
 =?utf-8?B?cnVZNkhVN0E1cmdxUWxwQVpqdmFHZlNsMk9ZNDhjUnNncWJBcjRqZytOeURo?=
 =?utf-8?B?Ylh5RjBhdFpITHA0bVBKc3VIa2VrSENUTVlJMHZNeHZ3RnNOV0xSYTQzNmxm?=
 =?utf-8?B?c3ZHbmJwNzVjQ0lMQ1g1cDFidFVTVmY5V0JyQ3kyRFkrcVgwMWZLcmVxKzNj?=
 =?utf-8?B?VklEUVFWb2o4dlR2c1pCZFlnTkFWcGd5WUg4SXFFV0UvZGJaQkVSVkJUeHFV?=
 =?utf-8?B?RHI5YlBJT1hvaElNcnQxV3YwVk52bVBJL0RVb3dNYUdaSWlDRHJodmhTYVhI?=
 =?utf-8?Q?kzrma0U/HSQNxSDsoZK7aNqMEYHV9Z74CECxSuZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnpoMlNEenJFYlc4cDNNa2NBd2twQzBKK3ZzdlBvdzdvbU9hQnBRWmU1bUhF?=
 =?utf-8?B?czFIdHpQNmd6TmRzbXRPdVVLSW1ndG1BdFBsN0MyazMyYlA4OG02Szh1RVFp?=
 =?utf-8?B?K3BZbHo0VzluQ21oYlBXaGxkOHYyOXRpclFYc0pHUjNpL0hyMjFEaEx5OWpt?=
 =?utf-8?B?MXhjSVNpcGdlMDJzTXpxMHJLbW1naFN2TkxCZXQ4cmVsOE5rZUdDMnJDMHM2?=
 =?utf-8?B?dElWQnB5dEpIR1J4SWNhaUxMWUF6QzNsR3kvbWtMQzRPWkxJVkl2eENndlNO?=
 =?utf-8?B?WGd4OTlnaTl2WjZnNmFZVTFaNDh5bVNKSStOTVhFS1J0YWU1Ry9meEtTdllM?=
 =?utf-8?B?ZlVMSUQ1TWREbE9kVFprMFQrdG5ZTVR1cytobnNDc3l1Mi9WenFxbjNuQ01n?=
 =?utf-8?B?bWdZOUprSDErTUVadWpVdU5uenZOdVVWVVpKWFN5YmNDaktxZVNqTDBadndQ?=
 =?utf-8?B?aUMvWlVVQ0lWV01NRDlqZ1NXcGZYOFJjUUVib2FjMXo3cEhKT2RQNVhDNWJZ?=
 =?utf-8?B?NmdtVHRpSG9RR2ZSSDFqTGtQS3lVUFVxcWFXQjFpL3RoQkROQkFiUUtXamdk?=
 =?utf-8?B?dlQzQ3BuSTlNaXBWcnc3M1VoSU9oWGJmY1YxekNBcnVKYmFUUjZxT0tGcHdB?=
 =?utf-8?B?SUtyeHVLRlBlMmFLSGlwQk93RmdxdHQ3R2JhNEF5b2pMbG9oMytpM1M0bnFv?=
 =?utf-8?B?bWg2QmlZNjhmQ1JLaElDYy9qUUQrZUdYSmdmSmhOWGZSUTV5T25VWWtuVHRp?=
 =?utf-8?B?UmpXaVo2L3pPSkdTRzFRNVRWMzNjVC9JMTB0SzJZR0pEV2NPbjc5UVJpNC9S?=
 =?utf-8?B?alFkR2tSMVhSVzVMd2ZWQkZoWmV3QUR0R1hXUW1Tb3g5emhtbzN2LzE1VnFP?=
 =?utf-8?B?bDNhWXhkMmpNQnJxZmpJMmNIZ1l3ZjVIOXJSWkhxb2RRK2xyYjBScnlDTWRy?=
 =?utf-8?B?TXNWNEJxVHo4b25ZNmJJcE9FTjVBMHhJaWExL2FKdTN2SlhJMHpqR3JyWDhF?=
 =?utf-8?B?TnZDZ2dlMlh3SmhzQ28wUkNEYm5YRGdnV0pORzZwTXdiSmdBeXlLVkJvUzJU?=
 =?utf-8?B?VXhHamwxNFhJTVFKYjdjYUp1NUlYcytnZTdNeUJDS1YrNy9BRlFCV05aVDhj?=
 =?utf-8?B?dHozL0I2QVhYTE96YlRwMnBmZ0FyV1ZhZ3lBSE80MEZycWloaTlpd1BjcXZX?=
 =?utf-8?B?a2hLSE5FY3pTZFgxYmduWjRWRmVRSStWYzUxckZrNFdVMWxQaEZhSWtoY0Zo?=
 =?utf-8?B?Wlo0TGZNTmluZFJNMU4zZ2cvMGhsakFnNTRtK1dlWFZmNXNVRVRXZVZoTURh?=
 =?utf-8?B?QWNYYkNMZDAwS0JZemExbzg2dzNMNzIrblRDTDk3VVUyVHowTkZjMVlkUGox?=
 =?utf-8?B?YXBTcmVrSllpL1lFNFBWV25PZ0doaTF4LzdIQjIxYmo2eFoyelBDWkFGR3Ra?=
 =?utf-8?B?SGdjWmE0NHE4UjlHUS9tZDk3UkVhaDBjWDZ2KzMrdnVSNUcraER6NHhkUEJS?=
 =?utf-8?B?TFR3MDkxdG9xOFVqMVk3Sm96VUtmZ2s1ZE9PZnJHbGJiZEVYT0RjckdOZ0pq?=
 =?utf-8?B?ZjhkQjg1NkpxZWw1VFhUelYyZUhna1JpRGlmQVd4WU5oWFVyZFh1TWJGOUFT?=
 =?utf-8?B?SVZUQjlpRm5VdHg1UnI4a1ZuVTEyNXArOHNNcnQvOTlTMXBiaHVhbFRpdHJZ?=
 =?utf-8?B?V1lxYkFCbkI0eTlDdjJYb1NRUHJpMTg5TDcxVHB3aFNteXRuaVlseG5WR0gx?=
 =?utf-8?B?YzgwblBpWEhwQTBSeVBSaDk4MHF2NHl3UTFmTHMzdytYdkJOeFJvRXlmcnlV?=
 =?utf-8?B?ME11TWkzLysvUlVKK1BMdFpFZERLQ2xUcm1hbTUydXlmQkZ2bWQybWxpcStU?=
 =?utf-8?B?MW1HR3ZiQjlTVktLWWprTGthUWhLaDYxdTJuaERZckVtMEhqRDlwa3c2eDE4?=
 =?utf-8?B?Y1QrZWNSSEZxa2tDME9FeHdobGxxUE1JMHZmNjA4eFk4L1ZpdCtJcXVjb3ZO?=
 =?utf-8?B?TE1VR2xDd3hiMWU1STlrR0N1bmJlazBjdEgzVEVGNjhxMDBlQlJYZ0pNQ3pa?=
 =?utf-8?B?cEdCTkRRQmlIeDdoVmFuMnBSdG1WNjZEOWhmNmw3M2pRMGxjNy9RV1VLY2V4?=
 =?utf-8?B?YjRncUtKQnFuRXMxUDBIbHZOY3hiSkxEWFBCRDc5K3Y2RksxMmlFbEhxd01O?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7247624-6959-4f47-ab62-08dcffb8dac1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 05:47:39.1085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoVLBVyJwvaEOLxgT0ZctO+dBFab9tcq+sCpi9jxRxpcZpWbv6z7jmBu2n0N4e1zcPHEkQfKLN48JUZbBrk4W5G/gz35CmrKZwao6EYbJ5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7163

Hi Christophe,
     Thanks for your review. Most will take your advice.

On 2024/11/1 17:15, Christophe JAILLET wrote:
> [ EXTERNAL EMAIL ]
> 
> Le 01/11/2024 à 03:06, Xianwei Zhao via B4 Relay a écrit :
>> From: Yiting Deng <yiting.deng-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
>>
>> This is the third amlogic driver. The RTC hardware of A4 SoC is different
>> from the previous one. This RTC hardware includes a timing function and
>> an alarm function. But the existing has only timing function, alarm
>> function is using the system clock to implement a virtual alarm. Add
>> the RTC driver to support it.
>>
>> Signed-off-by: Yiting Deng 
>> <yiting.deng-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Xianwei Zhao 
>> <xianwei.zhao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
> 
> ...
> 
>> diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
>> new file mode 100644
>> index 000000000000..decd74df225c
>> --- /dev/null
>> +++ b/drivers/rtc/rtc-amlogic-a4.c
>> @@ -0,0 +1,473 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2024 Amlogic, Inc. All rights reserved
>> + * Author: Yiting Deng 
>> <yiting.deng-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/rtc.h>
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/time64.h>
>> +#include <linux/delay.h>
> 
> Nitpick: sometimes, alphabetical order is preferred.
> 
>> +
>> +/* rtc oscillator rate */
>> +#define OSC_32K                      (32768)
>> +#define OSC_24M                      (24000000)
> 
> Nitpick: maybe these () could be removed to ease reading?
> 
>> +
>> +#define RTC_CTRL             (0x0 << 2)              /* Control RTC */
>> +#define RTC_ALRM0_EN         BIT(0)
>> +#define RTC_OSC_SEL          BIT(8)
>> +#define RTC_ENABLE           BIT(12)
> 
> ...
> 
>> +static int aml_rtc_set_time(struct device *dev, struct rtc_time *tm)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +     u32 time_sec;
>> +
>> +     /* if RTC disabled, first enable it */
>> +     if (!rtc->rtc_enabled) {
>> +             regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, 
>> RTC_ENABLE);
>> +             usleep_range(100, 200);
>> +             rtc->rtc_enabled = regmap_test_bits(rtc->map, RTC_CTRL, 
>> RTC_ENABLE);
> 
> Should we have something like:
> 
>                 if (!rtc->rtc_enabled) {
>                         dev_err(dev, "<something>");
>                         return -EINVAL;
>                 }
> 
> if enabling fails?
> 
>> +     }
>> +
>> +     time_sec = rtc_tm_to_time64(tm);
>> +     if (rtc->config->gray_stored)
>> +             time_sec = binary_to_gray(time_sec);
>> +     regmap_write(rtc->map, RTC_COUNTER_REG, time_sec);
>> +     dev_dbg(dev, "%s: set time = %us\n", __func__, time_sec);
>> +
>> +     return 0;
>> +}
>> +
>> +static int aml_rtc_set_alarm(struct device *dev, struct rtc_wkalrm 
>> *alarm)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +     time64_t alarm_sec = 0;
> 
> Nitpick: No need to init.
> 
>> +
>> +     /* if RTC disabled, set alarm failed */
>> +     if (!rtc->rtc_enabled) {
>> +             dev_err(dev, "RTC disabled, set alarm failed\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     regmap_update_bits(rtc->map, RTC_CTRL,
>> +                        RTC_ALRM0_EN, RTC_ALRM0_EN);
>> +     regmap_update_bits(rtc->map, RTC_INT_MASK,
>> +                        RTC_ALRM0_IRQ_MSK, 0);
>> +
>> +     alarm_sec = rtc_tm_to_time64(&alarm->time);
>> +     if (rtc->config->gray_stored)
>> +             alarm_sec = binary_to_gray(alarm_sec);
>> +     regmap_write(rtc->map, RTC_ALARM0_REG, alarm_sec);
>> +
>> +     dev_dbg(dev, "%s: alarm->enabled=%d alarm_set=%llds\n", __func__,
>> +             alarm->enabled, alarm_sec);
>> +
>> +     return 0;
>> +}
> 
> ...
> 
>> +static int aml_rtc_read_offset(struct device *dev, long *offset)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +     u32 reg_val;
>> +     long val;
>> +     int sign, match_counter, enable;
>> +
>> +     /* if RTC disabled, read offset failed */
>> +     if (!rtc->rtc_enabled) {
>> +             dev_err(dev, "RTC disabled, read offset failed\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
>> +     enable = FIELD_GET(RTC_ADJ_VALID, reg_val);
>> +     if (!enable) {
>> +             val = 0;
> 
> Nitpick: If val was initialised above, you could save 2 lines of code here.
> 
I'll leave it as it is, and seting value here is a better representation 
of the meaning of the variable.
>> +     } else {
>> +             sign = FIELD_GET(RTC_SEC_ADJUST_CTRL, reg_val);
>> +             match_counter = FIELD_GET(RTC_MATCH_COUNTER, reg_val);
>> +             val = 1000000000 / (match_counter + 1);
>> +             if (sign == RTC_SWALLOW_SECOND)
>> +                     val = -val;
>> +     }
>> +     *offset = val;
>> +
>> +     return 0;
>> +}
> 
> ...
> 
>> +static int aml_rtc_probe(struct platform_device *pdev)
>> +{
>> +     struct aml_rtc_data *rtc;
> 
> Nitpick: defining:
>         struct device *dev = &pdev->dev;
> 
> would simplify code bellow.
> 
>> +     void __iomem *base;
>> +     int ret = 0;
>> +
>> +     rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
>> +     if (!rtc)
>> +             return -ENOMEM;
>> +
>> +     rtc->config = of_device_get_match_data(&pdev->dev);
>> +     if (!rtc->config)
>> +             return -ENODEV;
>> +
>> +     base = devm_platform_ioremap_resource(pdev, 0);
>> +     if (IS_ERR(base))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(base), 
>> "resource ioremap failed\n");
>> +
>> +     rtc->map = devm_regmap_init_mmio(&pdev->dev, base, 
>> &aml_rtc_regmap_config);
>> +     if (IS_ERR(rtc->map))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(rtc->map), 
>> "regmap init failed\n");
>> +
>> +     rtc->irq = platform_get_irq(pdev, 0);
>> +     if (rtc->irq < 0)
>> +             return rtc->irq;
>> +
>> +     rtc->rtc_clk = devm_clk_get(&pdev->dev, "osc");
>> +     if (IS_ERR(rtc->rtc_clk))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtc_clk),
>> +                                  "failed to find rtc clock\n");
>> +     if (clk_get_rate(rtc->rtc_clk) != OSC_32K && 
>> clk_get_rate(rtc->rtc_clk) != OSC_24M)
>> +             return dev_err_probe(&pdev->dev, -EINVAL, "Invalid clock 
>> configuration\n");
>> +
>> +     rtc->sys_clk = devm_clk_get(&pdev->dev, "sys");
> 
> Maybe devm_clk_get_enabled() to simplify code below and the .remove()
> function?
> 
>> +     if (IS_ERR(rtc->sys_clk))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(rtc->sys_clk),
>> +                                  "failed to get rtc sys clk\n");
>> +     ret = clk_prepare_enable(rtc->sys_clk);
>> +     if (ret)
>> +             return dev_err_probe(&pdev->dev, ret, "Failed to enable 
>> clk!\n");
>> +
>> +     aml_rtc_init(rtc);
>> +
>> +     device_init_wakeup(&pdev->dev, 1);
>> +     platform_set_drvdata(pdev, rtc);
>> +
>> +     rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
>> +     if (IS_ERR(rtc->rtc_dev)) {
>> +             ret = PTR_ERR(rtc->rtc_dev);
>> +             goto err_clk;
>> +     }
>> +
>> +     ret = devm_request_irq(&pdev->dev, rtc->irq, aml_rtc_handler,
>> +                            IRQF_ONESHOT, "aml-rtc alarm", rtc);
>> +     if (ret) {
>> +             dev_err_probe(&pdev->dev, ret, "IRQ%d request failed, 
>> ret = %d\n",
>> +                           rtc->irq, ret);
>> +             goto err_clk;
>> +     }
>> +
>> +     rtc->rtc_dev->ops = &aml_rtc_ops;
>> +     rtc->rtc_dev->range_min = 0;
>> +     rtc->rtc_dev->range_max = U32_MAX;
>> +
>> +     ret = devm_rtc_register_device(rtc->rtc_dev);
>> +     if (ret) {
>> +             dev_err_probe(&pdev->dev, ret, "Failed to register RTC 
>> device: %d\n", ret);
>> +             goto err_clk;
>> +     }
>> +
>> +     return 0;
>> +err_clk:
>> +     clk_disable_unprepare(rtc->sys_clk);
> 
> Should device_init_wakeup(..., 0) be called here?
> (as in the remove function)
> 
>> +
>> +     return ret;
>> +}
> 
> ...
> 
>> +static SIMPLE_DEV_PM_OPS(aml_rtc_pm_ops,
>> +                      aml_rtc_suspend, aml_rtc_resume);
>> +
>> +static int aml_rtc_remove(struct platform_device *pdev)
> 
> Should'nt it return void?
> Compilation fails with latest -next.
> 
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(&pdev->dev);
>> +
>> +     /* disable RTC */
>> +     regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, 0);
>> +     clk_disable_unprepare(rtc->sys_clk);
>> +     device_init_wakeup(&pdev->dev, 0);
>> +
>> +     return 0;
>> +}
> 
> ...
> 
> CJ
> 

