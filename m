Return-Path: <linux-rtc+bounces-3352-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88641A4AD3E
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Mar 2025 19:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B35B16A815
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Mar 2025 18:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9791E5B6F;
	Sat,  1 Mar 2025 18:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwNuzjJh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988331DE3CA
	for <linux-rtc@vger.kernel.org>; Sat,  1 Mar 2025 18:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740852731; cv=none; b=R/PvfIYTAdkmc95o4vyt0DSYPm7fYpT5n1zLTDrEzwGwIyma4IO9m0seenQIa7czrgBFbxeEFTCbLKDjU6ihfpaMCEzWVlp0AnVW1cONL3CxHdELvJOH0aVzjILV2xISvwCQece7MPZfdIWSbcMEIKIMe8v+lItUnFG5eMYaKMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740852731; c=relaxed/simple;
	bh=Eg0hFQaD8ycLhbpwZvT+7PAZXueZuxzeChkcp4728Mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNIB7GodCsFgEeBAEEJBTwWqEAbwtrd/nbwhSixTe394LBywRIT+yixocrOLBJ6rFkNIfUkvEIfI9oSqUY0JrIb7jW0040NHkNRueSIWo3eWXWd4OiBtbmeEnpbcIN83hH60j81Mc8QEylp6LZclHiNXj/JjCRUGo3sl6i+WNPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LwNuzjJh; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bae572157so2121531fa.3
        for <linux-rtc@vger.kernel.org>; Sat, 01 Mar 2025 10:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740852728; x=1741457528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eg0hFQaD8ycLhbpwZvT+7PAZXueZuxzeChkcp4728Mg=;
        b=LwNuzjJhf8t9gZFJEzYdneEttpVvh1M5eiizXXvuG/Jto1lri+V+J2W0n55nuC7flH
         tPthnUkFlSHBwpcq4OkxyFDhQ6SdBsVOQiWRV26MVkT78mCpTH8MoMMw7Eg3OYrLLYyK
         cO83MtN0um/VtLfV41ho5z93VBU9jo6q/6fTz8iSy9MfI5b5T1lGFbCIYc5Xoq69WOcu
         YP2VZ+/AJkWZM1HsOC4x2/Yj/hiUNEA27MYiBBRHwRMPThB8l4rThWVf3PDk6DSal3KY
         vVgtDJBtNhcu6f3tGIljGTyJTDOoHkLO5eflGtRBkVewkcxs5LqDE8a04oGztKIrhGmf
         UM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740852728; x=1741457528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eg0hFQaD8ycLhbpwZvT+7PAZXueZuxzeChkcp4728Mg=;
        b=RiJcHlc2Pzp+F8J/trwz6Xtj2+OVtUo8DVu3e0gZD9Kt3NUiNOPoZ0QcqpakbIOa0V
         Yo3szIiq06JyiL2wrxSsM/s2+8d72BPmKs6aED4ORnA4lYWyRntUuTM9ZfotdTlug+Kb
         /Ecfg1n9oETCSa2/4sIgV9YJw7JnGGCYmDvRvcTCC1vQJxv8gRZS70Mas2OfgQnattSD
         1Yx590wWWAHGZ10FzjBCR0CfHR1+aIb9IHPIegPBaPMXAEPfuxjVWaUJMH8/motB9Ud0
         hVEGA3USqtIYr9iRyW0RTV4r4HUbaz/nrKk+nHZoBdw+DsxuPGI4WiS+fUGiR6qtWg2+
         tDaA==
X-Forwarded-Encrypted: i=1; AJvYcCWwqvpWyqgWDNDVQyetpD9u/qTak+tf65/FTYeI73zra6zgaOxw+MGfdoGTQzz6zsa4mGAsC2l7KrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOG63u39hIE0u32V0Fc94RRXa2MhwR94FFmRzafupxc4Fp0M3r
	LjpnJ6lUsMptTEFhZA81a4wYoWSV60bh2hVf57emYCQtcyfjv+LyysJioirRrBOO/fuMm52f0Ib
	kRKCjMINc0z+J8X0ykMuiTe2Fp/XuE8W/vbI5cQ==
X-Gm-Gg: ASbGnctEfC19PI5WOcuvde0qcGLkZfsZR6zuZTERewuVfn+wAfMvNfxQixcw/lGdFH0
	+dlTMAbGEblecEmEgMNtM4ilsBXw+4T4Ixjtowo7KElDsYW0s36OAnNJlLxv7V/MSQxnqugGyzo
	zv8RLialKlkyKm3Ja36jL+wZPa9Q==
X-Google-Smtp-Source: AGHT+IEH99Tq5urSrvxoc72GqejnsJAsNSDML6g3rnh8KP+Vmtk9gqB7j3gZFHmLs6QHmiQqUlP2gDlbwUBJuyx82iI=
X-Received: by 2002:a2e:8052:0:b0:307:e368:6bd6 with SMTP id
 38308e7fff4ca-30b933037d4mr26808421fa.32.1740852727658; Sat, 01 Mar 2025
 10:12:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org> <20250228-rtc-cleanups-v1-10-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-10-b44cec078481@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 1 Mar 2025 19:11:56 +0100
X-Gm-Features: AQ5f1JrUCPCMLG1ATCrGher1b7FQk-JSwRhx_use4qjyzNuoMvAXn5iqo9KhAOA
Message-ID: <CACRpkdamF4B1y+zr-Y_XB8gAoSv2Q2U4VxuZd+ivZq7KV1Quyw@mail.gmail.com>
Subject: Re: [PATCH 10/18] rtc: pl030: drop needless struct pl030_rtc::rtc member
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, =?UTF-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>, 
	Dianlong Li <long17.cool@163.com>, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 3:07=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:

> The memory pointed to by the ::rtc member is managed via devres, and
> no code in this driver uses it past _probe().
>
> We can drop it from the structure and just use a local temporary
> variable, reducing runtime memory consumption by a few bytes.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

