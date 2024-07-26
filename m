Return-Path: <linux-rtc+bounces-1623-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F0F93DA02
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 22:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ED852812DA
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 20:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E256F149C45;
	Fri, 26 Jul 2024 20:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Od3TB5DT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB4B1428E5
	for <linux-rtc@vger.kernel.org>; Fri, 26 Jul 2024 20:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722027033; cv=none; b=rxKX1T56GE8ZTmEPIarW1xm0FcwJ8v3pfA/2g+NRfzD8FQd0BzR8NBpijCKA9oV+inWJdzo6VXZvm7GA8W2QBjpM3buepVHdVetoIPEAlfHDRyfmMHz1zsNCSmDF8qZLjhA9du+50pQ5WhkFld5xcxBmSMSc1JNtQ2/QjxB3naM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722027033; c=relaxed/simple;
	bh=KogmYRFSz2W2+mhD6V6jG3/dYCuZTqrU9wdwTpVNdWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ee2aXTzn2IX6zKTPzJ9sHXrA18VoHgG8bytliJobv+X16xeAF2kFTeRBA+je0VUgw/rgTpbYn2008y6V4H76jFMpVnXpC/pvjGoRmz3kcutVn6XPYKrtx7WR7AXdqSWD8QAz5WbkgS26nagfZOQ+rA3hEAL5U1kaI40XHvrj+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Od3TB5DT; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so2535159e87.1
        for <linux-rtc@vger.kernel.org>; Fri, 26 Jul 2024 13:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722027030; x=1722631830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sW23BR/or2MMuYF31lJOR7RMa4C6ZEhZGo6Oj9/Pb3Q=;
        b=Od3TB5DT1KbNLDO4XyQzumnKCWM80b/szVLnruv8B/gqtD8Kza5DQe3OA2yHGHRzm4
         nfKK0heMXTSckqurOqxkGxISsPtmPKZp7XkQjnYxURKXcmEGvOQOuG94cfAiMN8xhiLP
         zqgCUN9+9wO8Zw279XHYJECa6ej/0MtWniQ2XbQp9utEPKdl8DsnPVX4b0h75VntJxst
         LbwzhIMJmE0h8TP/bD4Ag8CfmPEWSWX7dhBi446lp2P/FaBd2aY7meHIZ5xNzNWnh+Bx
         n4GRIXwreAWUrajAkE2DUQ1IAkAPtr/hZ9rVmN2qPy1xxrw7tAO2W7TeUDwnH+9irlEY
         opKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722027030; x=1722631830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sW23BR/or2MMuYF31lJOR7RMa4C6ZEhZGo6Oj9/Pb3Q=;
        b=q2DsTHXsGfk1NE3UBztuYu8ZYocxxIw9PE5xkI4x5e98T2hn46BfPDUo56gFpPnMGT
         cxiJ/Wc6GXKFGrWMQFW1mJSOdXCuniFLPoe+Qi2mNaToeb5+75ufhRwvVXEzHyYFpq1O
         eqGxTU4KP28Jyeb4tEI+HUHom5mat1Jpzf44F7h8FpoqfrzlsTxqNcut9Xn+xr743Vwo
         WlFB9/9r6gKCQNUVZE+rfIbQo4bmO9unfyAvu0jkm7a0wwfDzmkKvegFDd46zH4IJgIz
         wI9fMdZwszmndcAgUZbanQLsbqGug5ufsqMW2+kLif1QgVwDhSjsml0nQyyQcMMVzfZK
         e1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWUQVUsoZ9Mf6IQfEYhHiEvgj3oZIs1wGGFQAGWMCh7dZJB+a+6B3beLoPgvp04qaxCFbIPOZLRfeZ/EkgrF4QhF69nB+twLF4A
X-Gm-Message-State: AOJu0Yw/akp0AYBhDgPLmu5sfLWYoc4zGkXP5B6cpQ+8D03LAgYJqqKk
	vL33uHIyyYsaMt9LoiYPbivYY8jwl1OY1A8lNI+AI3BKUgT99S1KoKodxm6L/jm7UQCXoiKKxgS
	gjYQim5fxYvVkWnw8aAv6k9+vMHwDW6Oog8Z7eA==
X-Google-Smtp-Source: AGHT+IFX49EtxpZmo3lCBvR7LAjeTkZmE2Z3kScGsck8eI7LPC1PBQoOA3czp83TviYDk42LHWvS4Ey6OgvmOSAZBX8=
X-Received: by 2002:a05:6512:32b6:b0:52e:9762:2ba4 with SMTP id
 2adb3069b0e04-5309b274931mr464874e87.25.1722027030326; Fri, 26 Jul 2024
 13:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722160022.454226-1-valentin.caron@foss.st.com> <20240722160022.454226-4-valentin.caron@foss.st.com>
In-Reply-To: <20240722160022.454226-4-valentin.caron@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Jul 2024 22:50:19 +0200
Message-ID: <CACRpkdZTntS7K4aLqoXKbfdO2xumx9nLnA7CXysuYML=ptTCzQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] rtc: stm32: add Low Speed Clock Output (LSCO) support
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Valentin,

On Mon, Jul 22, 2024 at 6:02=E2=80=AFPM Valentin Caron
<valentin.caron@foss.st.com> wrote:

> RTC is able to output on a pin the "LSE" internal clock.
>
> STM32 RTC is now registered as a clock provider.
> It provides rtc_lsco clock, that means RTC_LSCO is output on either
> RTC_OUT1 or RTC_OUT2_RMP, depending on pinmux DT property.
> The clock is marked as CLK_IGNORE_UNUSED and CLK_IS_CRITICAL because
> RTC_LSCO can be early required by devices needed it to init.
>
> Add LSCO in pinmux functions.
>
> Add "stm32_rtc_clean_outs" to disable LSCO. As RTC is part of "backup"
> power domain, it is not reset during shutdown or reboot. So force LSCO
> disable at probe.
>
> Co-developed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
(...)

> @@ -1928,6 +1928,7 @@ config RTC_DRV_STM32
>         select PINMUX
>         select PINCONF
>         select GENERIC_PINCONF
> +       depends on COMMON_CLK

Just
select COMMON_CLK

Why not, it will with 100% certainty be needed anyway by the system
clock controller.

Yours,
Linus Walleij

