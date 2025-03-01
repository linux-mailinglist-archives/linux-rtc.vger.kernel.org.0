Return-Path: <linux-rtc+bounces-3353-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4943EA4AD43
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Mar 2025 19:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04A573AFA6B
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Mar 2025 18:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966BD1E5B76;
	Sat,  1 Mar 2025 18:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rk9EL8sJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B849D1E570D
	for <linux-rtc@vger.kernel.org>; Sat,  1 Mar 2025 18:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740852759; cv=none; b=CjR3X0BQ4dERLiQk7srtT11ai3GyF7u8s97QX6c21PLH4TSD+W4kWfti828afvza7yZQaZ8yWiz8eas5D8N986jBK/gkOj0Xpq4lyujV7NZJtMX06yt4vIwkySp60itiZKfLitqElV14NGXyXQijv0Qjm8amNGnkyZakS8mUJRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740852759; c=relaxed/simple;
	bh=hO09TeiGW32giSrF/zFbXkUU8toE5ieO9mC6ZpO9u5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BsRWFEflkdsQQJg75ezmw40pPGUTzNW7HmahojwBkRaTJfP2Z3omekI9okXMltXdcKVL8hD48PFJV0aLdKhbb1zH9mJJ+PL9yRQFlCXrPaIINZrF5bLaRT8V9Owdx2uJYLWnHNeMbOBGusMz8zutUByUNXF/veBnUkXBwVrow1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rk9EL8sJ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5495888f12eso1074575e87.0
        for <linux-rtc@vger.kernel.org>; Sat, 01 Mar 2025 10:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740852756; x=1741457556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hO09TeiGW32giSrF/zFbXkUU8toE5ieO9mC6ZpO9u5A=;
        b=Rk9EL8sJWfHphK8pAqqnLFiAHzMVDeMtVes6WZAjupVQUUWkh8pLEV6O3AfNeOj+a7
         BIDGekmxSLeB44mR1+0XEj6z9xNy2BD5nTLkPwB6bDV8Ek7ZkIo3ABM2yn2+4jd8sgzD
         PQMkjHFloi2MEa0e38WFpdpnSGBNBw3UNyGnQ/DfhdC5vKlVqkN+xi0W38qsCztb2kqh
         9hsQLsqovLDqMe2zvzGIHENJssBR6AdYu0/v3b1wRjD00ok6joz9gWPtfZZizW84yuhm
         eZ0hbvy2VHt4BsvJk/pBt1DlNe8nvE9TeIN+an+ivHIGtt1AcNkHmj6Ss+h1+khbb35H
         1AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740852756; x=1741457556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hO09TeiGW32giSrF/zFbXkUU8toE5ieO9mC6ZpO9u5A=;
        b=c4l/oEUfWAUUEYNfyjTU5aUrKcHLqRVJDHwf+bygnOrtuq0JqpGU+Vy3sPOlBP8AiO
         nQ3UdWRirmXYL0KV1c7y3DHNmBoc7TM0KWC6KbrJzpskk45wdp1XnoHIYcwMYR1ZP6NC
         HML7RRmOXtHGsRc4I6xJPGSum0HSAKJ1vL8tx10AQ6WqAJMZHoxMhGOkas+cYmtPKrfj
         I54gTZ70CZKWcIBY0CKu4hnVIRW/I0asAmM1E4QJVS5Aj1SzE9jXyaRvR/Gu4jT4tokQ
         bzAppqLegXChVRO6gVOf3ty3N/ugBnCCNJCErhY7YPRGKQEnUn3X0b9pVkveguPzcC8j
         Z3cA==
X-Forwarded-Encrypted: i=1; AJvYcCVtSboZHHOn+Gj7M5li3tLrgSwJ+HjN7OQmqKYxamKxk9zqq24FIf4lBqdsASEN+4X5VGIMWO0gJvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrdDJLjrXMv1F5ktqwcShEkAVuM513ZMTGDL0yPvlZiiJzP1fQ
	CjX2E/XbvejHdEa54ULvQo1y+x+Au+3v4fQb0OryRBhi4PvTyh637X8Z+T32D6zb79ok+nA5DxN
	R9C9lkunK2iXgpAjiUR7unknTVfA2WRMbzM2SbA==
X-Gm-Gg: ASbGncsXHoy+z6KP2SRIFMFjl/Hbb4mPCDzc534baX6+3117CoJ+gz/eyZR08gYr8w/
	Ft3syceo6lBCCo9033JVp1zfNAMxD4jITyHGSEbd48oBN6LtgC8CfxrDXYWqmfDp2X9cPYjkrD3
	9muJD215TaocDCJ0ZLVIKNvfUxFA==
X-Google-Smtp-Source: AGHT+IEwNP6JAG/ImVlBbFKSPeJyF+kN1wgYSyFdUn518Azn4ly4yqI8vygkNmnNaNRO/2W3XMFUQZ4MRvI6PuiQBfo=
X-Received: by 2002:a05:6512:2391:b0:548:f3f5:b26a with SMTP id
 2adb3069b0e04-5494c38bc42mr3507636e87.50.1740852755828; Sat, 01 Mar 2025
 10:12:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org> <20250228-rtc-cleanups-v1-6-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-6-b44cec078481@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 1 Mar 2025 19:12:25 +0100
X-Gm-Features: AQ5f1JrMxHjOeiAFu01e9_js8hUt6QETaY6N275XhvcjrnB0bEBgE0astCzSAEQ
Message-ID: <CACRpkdaWjTiqSUj59YiQZ1jsJWzHZPMo3xS6n4_JwdAW6B_Kfg@mail.gmail.com>
Subject: Re: [PATCH 06/18] rtc: ftrtc010: drop needless struct
 ftrtc010_rtc::rtc_dev member
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

> The memory pointed to by the ::rtc_dev member is managed via devres,
> and no code in this driver uses it past _probe().
>
> We can drop it from the structure and just use a local temporary
> variable, reducing runtime memory consumption by a few bytes.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

