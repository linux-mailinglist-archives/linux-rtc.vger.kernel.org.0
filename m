Return-Path: <linux-rtc+bounces-1748-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B48961519
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Aug 2024 19:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E8091F21FB9
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Aug 2024 17:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A281C1D2F67;
	Tue, 27 Aug 2024 17:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="o6D/HTrs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262A61CFEB3;
	Tue, 27 Aug 2024 17:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724778204; cv=none; b=Ya8SXHQqUV0JODuUvyYKEQ7Ty+t/uBUYOuMgzNPuCifWJq6YziHY4tz/1CzZLC4f47UF024Tc+FQ5qmG2RvnhGK5Z2su0SaAOMaX8Xuiq6mqOFrYMqLNOcjIzGXGbeLb0uGs/F+H3iUpApb1t4qZwgoJUDmFjdswMlI/s1ZBPDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724778204; c=relaxed/simple;
	bh=YUXMtWpI/vSrwfGyZ1++T220Xr31JngpoQ/COuBLjrU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=bEBt/wMl2d94RRXf+nNhmRBPpsywY9AhF20L4tOxz7miGAAwnHaOSkJWMWKCy5Z62gcubhr7Y56gf4B6eZcVrOvYqnDAvZq1jcVpagq6d0k88bDMmyptOD0ppELzAZwbYakTo1AhUrVZWaa8RmdNAYprwLiRV76U7QQ1SrV0LTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=o6D/HTrs; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724778192; x=1725382992; i=markus.elfring@web.de;
	bh=YUXMtWpI/vSrwfGyZ1++T220Xr31JngpoQ/COuBLjrU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=o6D/HTrst7d4TlC7NSdAsI/EXf+2ku4KplkpFBFwASzSZYY6RmlF5EyKxt34703K
	 kNMbA1qvKN7gBpa1yE3NVB66q3mKBFL5cdhkcQCRP0FTEHt+Z6Qahcc379Khbgz1f
	 M9ZYYOD/zpudPJH27b8eDqmXLaZbcc9Gy9A6D7XxL+JP7RizN/763m2Iuxv8yuUY6
	 C6dxvwXxOUh3pm91jx1HMzhZO+wA8+z1NbsfhLZI+ySGLyVNhxIaffHCaqtb+j5QP
	 MWR3ZqVeHU4s8k3y+cCEar+jSipkfQjzmfh475htjbsFE8fmEyLe53lBflX9a1P65
	 /4KJXBwNW3m+P6bi8g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MhFhe-1sDnRS0tuc-00n9pY; Tue, 27
 Aug 2024 19:03:12 +0200
Message-ID: <770322bc-bd52-425d-a79f-93fde6157548@web.de>
Date: Tue, 27 Aug 2024 19:03:08 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>,
 linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?=
 <csokas.bence@prolan.hu>
References: <20240624-rtc-sd2405al-v4-1-2b2bc759f98f@gmail.com>
Subject: Re: [PATCH v4] drivers: rtc: Add driver for SD2405AL.
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240624-rtc-sd2405al-v4-1-2b2bc759f98f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v7VvrcKDYQtNeLN8nKSmhuoNpictKeXbuR9Pj8TAZN3Pm+LNo0u
 K/adZufBfB5FSuTle1V66G8POOZsGWqKvxLwHXLd9Z1PL4ph55115wGe3LMCNrGV9GUQdOc
 2Ld920n5e/7I8+WSC7erm9No8jGyQ/p2srQTKxpBJuWDH/BXig+qtFWS+N0/zQiEsCTIX34
 Ied3nQ4+8ngJs86S1+uIg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DwH89asBcxk=;+hGZYn/GS5qbuSCTRvqRp1wdS5R
 Pth43UEziipdvfFdSExcuuz3a9kCBYKaRllfXE0pSeX0kXIBeEtn/ZKjlyfByImdhN379ESKS
 mYH3hebUUsGtFM2ReFSE39xJuaBH/84SZFs0zuWxSOz0LjBgCKDvneM7IO2YljgmEdisJtx0g
 OAYMHH++JBdL8XEwph6yK55khr/WYZcVVJStnugWtnTmZl+JC2A7kXfyIW559z0APtFgbDLJr
 DcKDDW9aPkMQ7K6Nrxd8wEqJPSnRPYwvI/SBdraRuxkt1iRcVeYshDaOTLi+vI0zUAdljQh4k
 HSnBO8fIQW7fjPMicYUR3qyvLhIRTGADc6Y3rd0CJC7kyKlPhz+Ni8dPrAodLhK6Yvta1GSMi
 kwtf4Rs1vL/Wxgscx5xXnjJk8G2uwjR1Tumc6UB4EI6jTBapJP47wKaS9QPSurcp42XQ+717E
 wr3hWt+BAGVgw2M0L/yPioXLcETWwopKxv+oLLrTXlqTwYgcpyDdir8SV3MIP1hoTdHYgklsq
 NJzBTIhEgelgAx9RAGCfSb1CxLh4yMk79HY8ww4vxHgsGhgEEL1rUQyqnINqmGVZl+nL/tQF/
 72EvBb5uyGcSVD1IJ8RG4nz8DTu8wGOr7O8QG0NiJSvVnfAsPHpb+yKph1RahVHbmdrkLMirB
 +Qn65oysU33MxpJTRECwNkJcful+ciDPJXCdP62QvYRgNFO4MaQ0kIjD7YheK8DlybcfLn8QJ
 GBZ7IzuHdVJfukWVlLZ+rjgmhJBidVt5ZVeRjdXM4niTtpUYmW5BNm2wlQhYk1uNvKmSccnMs
 0CZ95deHjmR3txoW2jFVvaCQ==

=E2=80=A6
> +MODULE_AUTHOR("T=C3=B3th J=C3=A1nos");

Would you like to add an email address here?

Regards,
Markus

