Return-Path: <linux-rtc+bounces-5933-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL4QMWgGgmn2OAMAu9opvQ
	(envelope-from <linux-rtc+bounces-5933-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 03 Feb 2026 15:30:00 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1D8DA999
	for <lists+linux-rtc@lfdr.de>; Tue, 03 Feb 2026 15:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B19F30D075C
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Feb 2026 14:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5173A901C;
	Tue,  3 Feb 2026 14:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="o//rJKa0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012020.outbound.protection.outlook.com [52.101.66.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068CD341076;
	Tue,  3 Feb 2026 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770128647; cv=fail; b=mVMhBA+4CWkt/ryrpFvdCkh+jBHVUKlfvw91Z4K/i9lPHnGRSBnYBzOllKoZGwRBjQAOchy30uw3FKLS0W5xJaYShEyP+eDfmzNGUp42+Efq88HMdIMUvZpnA78Ix6rNpafLWWOtLHdksWj4bbdRcWw09oyCf/xIMQfrYHaaI4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770128647; c=relaxed/simple;
	bh=3cjABh+1MRNorXSkvaex1Diw/zgXa5Q6PKbUIpOebGc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YLt/sjOR6cusO1/EVVvaMt9r2o+R4ikBLu/IEQ8ua/EJZOXlJKmvwgfj1Uh5Rk3EgvRGUkf/Xa3W1x9B0vFCrm+YyB6UsQKnhfLfqQbIme0BOBhnuOAvF4cvEbvplvcX7DHFbgnCMDmEH8Z8fpnxxJQcQUKgymMubezKtaNribY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=o//rJKa0; arc=fail smtp.client-ip=52.101.66.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxXF8m08/HUNfonZT4NYf1HOvgAdeD3asUo1xlcsMAoRLzCivrAu+xQTsGEcUZjJnssbdJR63xH5hgrgQB09m32GSFdwzvZ7Pinai1vQyRYcI26GyCIT8E8m+AFPofjVx+YZ81aa4MfZMEId94rLtbLU6FSo6tGJl8C7MGUss+JiGzzY2Qm3Oj2D2ims+/7FzX6RigvSxuuYXC8ouoMb7wvoyON8CENZSWuqfdL0b6gSkBK7QOyX0pZnpBBcX/+0LasHIP/UYfOUg7pGKqC7mDPwuIUGLZT86MEr80c41zTSHDfeLUGri+6QlrLlCub0KohUcMdMqr+ZUSGPXa1ziQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVYDiAFWrxd7G9K47t2iSctBrBoMs3/MTQ8yWp8XfSQ=;
 b=lfdhwZG2yy9VfnbI2heue1G41M1gWfWvXIsBJy7/aZC5TCX8lxc3bFehrqaWIT8bJJl6bDlfPN+B061YyGMmOFAwE/QjpZ63ou5Tc6/FxO9mdZzTRh1LUIClNOd90ZaSYQIeUBtyZKAJyAZ+X+p09jz8+HYfZPTSi5N+HWP8Y+EiafhnehwczRZMYFISfhdJsrHhPwjiQkrIUOw6weIddaJtwF//sv68nxrPH9CccHBpg9dLEwCCOuhYWPAPAZRXBLC7o8GO80C3+tkh+gzxXnbyF7zVekYJpbtN/2yRuuoI9Py6V9ORghmphCTQw4cVi/egh6S5yAv+aF4V4XcZ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVYDiAFWrxd7G9K47t2iSctBrBoMs3/MTQ8yWp8XfSQ=;
 b=o//rJKa0E1ZGCr+vkarFqR8B9HigQVBMzTCWcBM70isewdb/l7LJyTEiWpWBkZPzEau4prCXfCiytZuS0iSJgdWqGf8lcYhMTLp7NCHy+JyG8fjQDueC33fMJvnzC96ZnmtD/nYSYJGZI1aAWckDXgaUGgxgA0NHAHxuQPWyAto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AM9PR02MB7329.eurprd02.prod.outlook.com (2603:10a6:20b:3e5::6)
 by GVXPR02MB10689.eurprd02.prod.outlook.com (2603:10a6:150:14c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 14:24:01 +0000
Received: from AM9PR02MB7329.eurprd02.prod.outlook.com
 ([fe80::3854:ac4f:3dfc:8113]) by AM9PR02MB7329.eurprd02.prod.outlook.com
 ([fe80::3854:ac4f:3dfc:8113%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 14:24:01 +0000
Message-ID: <b547a09c-6a4d-46f1-a855-95d561e18ac1@axis.com>
Date: Tue, 3 Feb 2026 15:23:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] rtc: ds1307: Add Driver for Epson RX8901CE
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Fredrik M Olsson <fredrik.m.olsson@axis.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@axis.com
References: <20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com>
 <20251219-ds1307-rx8901-add-v1-3-b13f346ebe93@axis.com>
 <20260131000350d1fac76c@mail.local>
Content-Language: en-US
From: Fredrik M Olsson <fredriol@axis.com>
In-Reply-To: <20260131000350d1fac76c@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0039.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::31) To AM9PR02MB7329.eurprd02.prod.outlook.com
 (2603:10a6:20b:3e5::6)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR02MB7329:EE_|GVXPR02MB10689:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d42ba7-100f-465e-765b-08de632fe005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFZBK1NRR0Q3Um8zMHJmaUl2cjkyRmFNRU5wQlc1KzNpR0VSY0V0NUxaZE91?=
 =?utf-8?B?ZWp6R3U5NjgyQmx5SloyaTdKaEExdVQyZmFpREFJbHh2MSs2TEk3VWpDVHFX?=
 =?utf-8?B?c0NkWElUTmhOdjNYZEUxVTBDWVBaQzJHTU9ReGZGdXhidFhaS1BqY3RHait6?=
 =?utf-8?B?eFVEWE1LdGU5T1ByWkZIbE9yMWxDb1hxOWNCN2MwaTlmdzVoQUtwWVh0cVFG?=
 =?utf-8?B?Z0RERHFxVXdpQWJXMWwzdnlmMU56aG9JS1Y5Sm1QRnBOcDhXWEJoZU9UN3Vm?=
 =?utf-8?B?R2lkT3ZNMTBENFJRYi84dXRlTnJJUE53ZUplNzdmSDZvbGVHKysxTEpZam5G?=
 =?utf-8?B?TStmTGtJMzNSRUhNMEdsMXM1U2I5dHdzZjhHcEZzSktHcHJMMUJoaVE5UHpL?=
 =?utf-8?B?WUoxNFlHVFdjL2FPNkhjb1hMRVR2UStvOVRYY0tQdUlYQlNjaVk1aHRrcWNi?=
 =?utf-8?B?LzVQako1eFFnRUYvcFhEYUMya1JSTlJJdjJqVkVLbVVpbUhDZi9GbFcrK1FS?=
 =?utf-8?B?TDZCVHRKc0RGdXZneWRiZU96d3JqdlpIRFlTL2N0OXhkMm1zUVpETGNFWTZl?=
 =?utf-8?B?QU9ZV3liVHVEc1lLMUlmYU1wL2Z6RllsbTNYaUg5N05oMitkcUJHN0VxcG81?=
 =?utf-8?B?Zyt3aU40SEd1ZWlTd01HR0lMQ2hMQ0JpSnVDcCtGUTB3d0M4akxOTHoybWQw?=
 =?utf-8?B?Zld5OEx2NmVrMTMwaXRMenhueTdoaCtQcitGZlFXNFBlTmdNMzNwM01WVHVx?=
 =?utf-8?B?ekErRnpPU29YVEo3MlJIaHVsS1BZMEZvL0I4UHBDeHlaMTZ0M21oUEsrNThh?=
 =?utf-8?B?K1BmV3V0ZW1BMGl3TVhBNGFNRElSajUvODI2aWpTc0w2MHRSbTFvS05DRVZ4?=
 =?utf-8?B?Rms1eE1Mb09ZY2Y3WGJLZXRGN1BESlFXY3ByVDd4TnJIZTBoTEJBVjB4SWRD?=
 =?utf-8?B?RUFOc0xoWnBYcExFRUlzelFSWGxzbVdkUU9mWU1vc1RRdEE3WkdGNHhieEtE?=
 =?utf-8?B?UU4rdE5FNnJoa1JLa0g5OFRYei9Qck5YRWgxU0V4cmxiL0k5dldqZEdGMTFt?=
 =?utf-8?B?VzlNTGhXWnVGeFRYZnF5YTVtckM1L1ZLU3RxVjhQK1dER1Z2eEozcXhiN1NK?=
 =?utf-8?B?NWJHRkkzUnF0dzVJWTlLQVFzUHVndVdpVVNZeHNoWGhDek1SZVNpaUNGcXJa?=
 =?utf-8?B?am56NzU5ZXV2NzFWZEF3bE5ndlhkMVh3TUxJSGpqOXNhaVFFODdRRnBjcmJE?=
 =?utf-8?B?SkxKdXpOeHBjTDdMdDdNcGFIQTljSlZ1ajZ0eUN5dGdJQ2dDMG1FZkQ3QUY0?=
 =?utf-8?B?WTdUUEgyY2NrU1BJeVZSdWRacWRqQWtSenI5ZnJiaEg3OVdNeGNYVUNYM2pm?=
 =?utf-8?B?RktoaXZiVTNRUEJPUXZqNVhCL0lDRWU0K0t4dENhaVlHNFBPTGkwMjc4NXN6?=
 =?utf-8?B?WHdhdkEwOEs0WGlxd2RDSXB6NkllWnYwNVM4Q3RFOFJZVnc2RUpSODBtWFhj?=
 =?utf-8?B?SjVDdmd4d041S08zZzljT0RQVGU5ZzgvcXN6RDR3V05KZUdCVkl6MUFsbDRY?=
 =?utf-8?B?SGs1dXJWRWdJWHRETS9tVzJnQlZIaTdWbklvYlZOckZUdnpCTm01WWc0SjMr?=
 =?utf-8?B?YkRqaTJ6M1RpVm5LT2hTTG9KeEc4YWFIT3I3Ny9nNWRzVFZXcGJHeHlqbXR3?=
 =?utf-8?B?QnRyTlFVZ3YydHppWUNVUFUwUS9yT1dENWNVemlqUGI5WWtSYzU1NDRwZ2JL?=
 =?utf-8?B?TWpMNzBFdFVCNzl5QjRPR2ZLTVhHd3BRM1ZBWVVUaHRFOGdBRTZ6UTNmcWdI?=
 =?utf-8?B?K1RBVTcrdk9iVWVISi9EZWZ5Q0czR2l6UmltVEc1YXhtejMydmthRThKOUsv?=
 =?utf-8?B?YlViM0JHK0dLTTlkR0JSOE16L2ZYQkgrT0pDSGlvU0hjVnRMYnk0dzNtMmFY?=
 =?utf-8?B?T1lML2w0RGo4RWpqemcwTG5uQnNoMXRxVjkrODhhNVIzRllNb3RpbkNLemJo?=
 =?utf-8?B?TGVJeEJXdzVPWGFpUHBnZW5LTVcwS1pHL1REQ3VUcHVzVk4yMzA0U3J2NHVT?=
 =?utf-8?Q?6DpQzj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR02MB7329.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUNkOGl3bStqbXFRdWpCQytQY1pLTWlZVTN4SlNXS2hZQXJPODl6cHNoc0dS?=
 =?utf-8?B?L080NEUwTVNZcENQTWF2eGkxaU9JUEJzSC92WkFUcGkzcFRQNkF4NG50ZUtG?=
 =?utf-8?B?OEw5L21wdlRUcW5ENk9maitBc25aTjd2dEJYdG9NR0dEMk1sS1pKQzZza1dQ?=
 =?utf-8?B?ZENLejNxYWE1OXU0WlA2OFlaZUh0WUtWZmFBaFRja3g3dklBMU9valE5Q05G?=
 =?utf-8?B?Tk1qQUhmZ2dQbzRVeXhleXkySGJEZCtocFVMTExObEVNcUhES2pZbE1MZmRP?=
 =?utf-8?B?TThnaGxCY0pidWM0ajVQSTdvcjhidERyemJvMzd2bXYyZ3hpTlhjYkdGQWFk?=
 =?utf-8?B?ZzExN1B2bUJ0MXJ0aCszcXo3VGExeGlHUDZ1RVp1WlJ2dTd5VE1FcSt0QkFR?=
 =?utf-8?B?VkE1VmlpSFJ4RGFZdW83U3cxZjIzSDhNUGtaSHdPeVpNM0p5TjVaMnhjZHhw?=
 =?utf-8?B?SXhuMW4zYXFFODVmTWFQZnYrWm1MS3NSY01qVXYvbGFWalhpek5jTXQvcWhW?=
 =?utf-8?B?SlhRZm95ak5XUFRXRHRMTVFnbkpralBVVHgxSWdMUVdsRzVaRlBudW53ejdv?=
 =?utf-8?B?dFBFaHJnOElFdmRKMW5qMEQ5RXZFZ0N2VDFrbCt3MkJ5OVZaaHdsWFBZUDVW?=
 =?utf-8?B?T1dTS09LTFk1WFl5S0srUWJtakxHQ3EvS3VBbWl2TWJwdWdkL1l3eGgxa3Nu?=
 =?utf-8?B?Y3lMb1dWTGxJa3JtTEU0NlFUTHM0OHFyQ2lFcHNOb3gyNGVjVUMxdXpHQk1B?=
 =?utf-8?B?bFZienJQT1lDTmpUQjBEeVBDWkQxZ1hmVjdHTXE3djZldndtWnFvZFFGdFND?=
 =?utf-8?B?LzBPdFU3UHBYQjNKWDB4TmE3djlGVHAxVEVpdVBzK1dnY2xwRTIrcWo3VEc2?=
 =?utf-8?B?ak05aThDc2RUVy8wVW92MUZsZ2tYbGxsaUVPWVgxSVdHL1VvZVVKbDN0SnZo?=
 =?utf-8?B?ZlFvQndnSWJzcllpMDRXT05PNHpMRmhwTVpEK3NidEhCdExCYjlVWDQxb2JT?=
 =?utf-8?B?bmxDVGNvbXo5NXFYWXlhaUpvNkNWR255QTFUTExVNDFHL282Vk9yRnBNWm1x?=
 =?utf-8?B?emp2UXVFaGlsbTd1QnQzcTNia0NuR3U4NmtLNUxlR3dEREV5WTlLRWZraThN?=
 =?utf-8?B?SW9TT2JMM3g5OFRTekpORnRudTJSbnlmOXh0OG9HZDN3STdYbUVPSkNaMi8x?=
 =?utf-8?B?MTBDVHVjOFVTa3FMNVNvRmhBL2p0Z0N5ZDFVYmhSSzhUSk0rSm1FeDM3RjNj?=
 =?utf-8?B?SVNLV1BiTGpWa2hrZDdaNkZOS1hTTys3SWJRYTY5Vm94UHcyaTIyVzhFVUpN?=
 =?utf-8?B?MVZFWjdLZU8xWE1PZTFyYTYwcTd6TWMzWkYwamJHUER3OFpRRUhIWUFZNVFl?=
 =?utf-8?B?cXhYL3I2ank0U1ZCaHp2aWdXNkVER2FOOXNQYWMrUFd4TUZWSHdXNGtaWFd2?=
 =?utf-8?B?T0tsVTUwU1gxOE9vNWpZbVBlRTlJTFhlREl1MlltTmFHZDN0eXFFaVJieHFI?=
 =?utf-8?B?ejlLeTQ2ZGRCVzczdy9WdHgrUkF6K2NUVFkyL01VTFlGZzFUeTJTMzBaNHVM?=
 =?utf-8?B?SmwxRUhMSjRJZEJsbi9GOXIxNDVkaCtqaUZFenliaGltb29CbjhVaW5GOElt?=
 =?utf-8?B?a3lIY3hYT0RadlZmR1RXRzBnd3FXaUM5VDFNUXhwNlgreUk4cTV4bkxWZ2F6?=
 =?utf-8?B?RWhEcVJObkFWQWRBM0hPM3V3bk5jY00raHBRSlVWNnNrdFZkMjdTeFEvUitn?=
 =?utf-8?B?dGg4RlFYVllnRnNpVU9BNEljVVJTUzRUK0FOc0k2cXRjUHNWTktpbFQ2WG84?=
 =?utf-8?B?SXNhcmc5WXo3eDcxTW1icGZ0Nlh3MXpTOEhrdi9GVVFZWlhubkJmdVJiTW02?=
 =?utf-8?B?bXpuNEFjZEh2S3U5OW1IZkg5d1VLV1NtaE9KTjB4ZGppeE1HeUdnVGhPZW9l?=
 =?utf-8?B?d3ZqeVFnTlRkL0NnV3J3VUYwcDk4MjBrYVFqaXAxdkRKYmhPUzdXeEp0THpz?=
 =?utf-8?B?Q2tzU0VsdStwUy9uSXlsMmJ6Qm0xN3lLemtxWTdPb0NIem9SRlRSazlkbDZK?=
 =?utf-8?B?WWVORTZmUFNmbis3eHhBSURMME91OE9YREhDMlBqR0d1VUtlcVdrRnMxZ3dO?=
 =?utf-8?B?THpzV0JpUlEwQ05temx3L0JSQ2lUVTZ0VFg3QThLMlprMUxFeGt2czNvRkdX?=
 =?utf-8?B?cmhiWjBnaUJwWXVXRUZ5OEZITFV3TEttMFRxYlIzZE92Ni93U3NXM2IwUTRs?=
 =?utf-8?B?WlJ6VVdQT1BMVXlkS0laRDdDdGpLZG9RY1U1NW9obUkwdVdKZmdIZ0doVnJL?=
 =?utf-8?Q?Zzggs+raYcEKS8gO83?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d42ba7-100f-465e-765b-08de632fe005
X-MS-Exchange-CrossTenant-AuthSource: AM9PR02MB7329.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:24:01.1439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfROSV49mvTSkDMoEKw64GctipfwEbXRbSGk5EmAAB0Sh1YPuFVt4Doc4cGOaIKFNUTaqtmoiUbK9dwL36dT0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10689
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axis.com,none];
	R_DKIM_ALLOW(-0.20)[axis.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[axis.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5933-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fredriol@axis.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,axis.com:mid,axis.com:dkim,aka.ms:url]
X-Rspamd-Queue-Id: 2D1D8DA999
X-Rspamd-Action: no action

On 1/31/26 01:03, Alexandre Belloni wrote:
> [Some people who received this message don't often get email from alexandre.belloni@bootlin.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hello,
> 
> On 19/12/2025 13:10:37+0100, Fredrik M Olsson wrote:
>>   #define MCP794XX_REG_CONTROL         0x07
>>   #    define MCP794XX_BIT_ALM0_EN     0x10
>>   #    define MCP794XX_BIT_ALM1_EN     0x20
>> @@ -226,6 +233,19 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
>>                        dev_warn_once(dev, "oscillator failed, set time!\n");
>>                        return -EINVAL;
>>                }
>> +     } else if (ds1307->type == rx_8901) {
>> +             unsigned int regflag;
>> +
>> +             ret = regmap_read(ds1307->regmap, RX8901_REG_INTF, &regflag);
>> +             if (ret) {
>> +                     dev_err(dev, "%s error %d\n", "read", ret);
> 
> The multiple dev_err you are adding should be dev_dbg as there is no
> other actions for the user than to restart the operation when it fails
> so there is not actual value apart when debugging.
> 

Okay thanks I will update that for v2.

>> +                     return ret;
>> +             }
>> +
>> +             if (regflag & RX8901_REG_INTF_VLF) {
>> +                     dev_warn_once(dev, "oscillator failed, set time!\n");
>> +                     return -EINVAL;
>> +             }
>>        }
>>
>>        /* read the RTC date and time registers all at once */
>> @@ -307,7 +327,7 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
>>        tmp = regs[DS1307_REG_HOUR] & 0x3f;
>>        t->tm_hour = bcd2bin(tmp);
>>        /* rx8130 is bit position, not BCD */
>> -     if (ds1307->type == rx_8130)
>> +     if (ds1307->type == rx_8130 || ds1307->type == rx_8901)
>>                t->tm_wday = fls(regs[DS1307_REG_WDAY] & 0x7f) - 1;
>>        else
>>                t->tm_wday = bcd2bin(regs[DS1307_REG_WDAY] & 0x07) - 1;
>> @@ -358,7 +378,7 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
>>        regs[DS1307_REG_MIN] = bin2bcd(t->tm_min);
>>        regs[DS1307_REG_HOUR] = bin2bcd(t->tm_hour);
>>        /* rx8130 is bit position, not BCD */
>> -     if (ds1307->type == rx_8130)
>> +     if (ds1307->type == rx_8130 || ds1307->type == rx_8901)
>>                regs[DS1307_REG_WDAY] = 1 << t->tm_wday;
>>        else
>>                regs[DS1307_REG_WDAY] = bin2bcd(t->tm_wday + 1);
>> @@ -422,6 +442,17 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
>>                        dev_err(dev, "%s error %d\n", "write", result);
>>                        return result;
>>                }
>> +     } else if (ds1307->type == rx_8901) {
>> +             /*
>> +              * clear Voltage Loss Flag as data is available now (writing 1
>> +              * to the other bits in the INTF register has no effect)
>> +              */
>> +             result = regmap_write(ds1307->regmap, RX8901_REG_INTF,
>> +                                   0xff ^ RX8901_REG_INTF_VLF);
>> +             if (result) {
>> +                     dev_err(dev, "%s error %d\n", "write", result);
>> +                     return result;
>> +             }
>>        }
>>
>>        return 0;
>> @@ -568,6 +599,17 @@ static u8 do_trickle_setup_rx8130(struct ds1307 *ds1307, u32 ohms, bool diode)
>>        return setup;
>>   }
>>
>> +static u8 do_trickle_setup_rx8901(struct ds1307 *ds1307, u32 ohms, bool diode)
>> +{
>> +     /* make sure that the backup battery is enabled */
>> +     u8 setup = RX8901_REG_PWSW_CFG_INIEN;
> 
> You can't do this as this will cause issues in the future for people
> wanting to keep this bit disabled (the main reason being that you don't
> want to draw power from the battery while your device sits on a shelf).
> You have to handle the RTC_PARAM_BACKUP_SWITCH_MODE parameter and then
> switch it from userspace.

Here my intention was to do something similar to what was done before 
for the rx8130 device [1], which as I understand it require similar 
setup initialization as the rx8901 device does. Is using the 
RTC_PARAM_BACKUP_SWITCH_MODE the new way of performing this initialization?

> 
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


[1] 0026f1604c9b (rtc: ds1307: enable rx8130's backup battery, make it 
chargeable optionally)


-- 
/Fredrik

