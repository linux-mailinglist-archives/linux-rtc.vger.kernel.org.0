Return-Path: <linux-rtc+bounces-1624-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A889293DA09
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 22:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 446FAB211B8
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 20:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EBF149DFC;
	Fri, 26 Jul 2024 20:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TqiMfGi9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677031465B8
	for <linux-rtc@vger.kernel.org>; Fri, 26 Jul 2024 20:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722027127; cv=none; b=E/Ziab4boZH8irfx0DeG1uZtSUPgx2mWQlgZmYgiX2aHma5KdZs4xaEoS4wVJBVBKtkuA8HZz4rVP2VHUrS9EVyvQPgxBaZL+L6to27iMg11wgP9ONuYN/gnBSvxU+ofWFznzQ3Ep/Sv704eHcpKIWiBiOk73OSd9uxOljWvhO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722027127; c=relaxed/simple;
	bh=JI5ZgaYoPgocYBo33Z1jABDgbCrXDHkgPxPPgMs9nV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRB7hvJwAOs3VFqMh0Gagof7bxAkxOaBx67pe/wMFDVioYVefDbzE0TDKZ3ZZl/qPQr2IzX3zkGvjMUbIbh9Ihc+pFOJvknBlC8LvbkzbzSW/xu8C5rHIDIIfsayjdF2c9C2gI+WdK+3lFplXtgCf+8Q88PuhXQuLlfi4zNq+Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TqiMfGi9; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52f01993090so2494441e87.2
        for <linux-rtc@vger.kernel.org>; Fri, 26 Jul 2024 13:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722027123; x=1722631923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JI5ZgaYoPgocYBo33Z1jABDgbCrXDHkgPxPPgMs9nV8=;
        b=TqiMfGi90LQBATxl7Jc1lrCY7TrNgs31n9x5ELG7BGinZWnm0F7JJ1r02rW8SqSOjU
         cQpuu9u0NoHOV+09AQBQKQdCq8mKQoP6W9bHtYhzAMDHZpQEO5g5HmM6SLeUFfJ/YtD3
         jyw4kPWJouqEQdGBnU8IXBQeaovFG01nP004WT0Pfx+KVGIIXk2/S3GbrXdVLWRlMna8
         RsQ8qppwlKM2D5XdGndUpVJr0ZOA+knD6jQff5qJuf966Z7IMS0DY3JJp3U1ra56INIz
         SpPTGZOfj0xjjsCnFER33mBf7fcvRzlqES1wuWSU3vvE4/jgFn2lgaT58bvbegY58sbm
         J5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722027123; x=1722631923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JI5ZgaYoPgocYBo33Z1jABDgbCrXDHkgPxPPgMs9nV8=;
        b=fb5F+JzkSVSXX/mig2qMc2b4aT83/lXN7lW7hlx0nSndWVhyy4Fnbq9TSuawyVKk3/
         rKplRLKLYlIdzkulTWswVXAG9Tng/IwHVoPgQIK1maJDRlULwnthEF8yWdgx8kElJ/ne
         Imq2TEBYwoYDP4WeXBrnt8CrpKvnGpb/KE4cnliwiRaN7yunk4FCuhK01H2lJKS1vLqn
         4Sw1BclfYHiP7zfwDDr7F1ER/71j4LBk0Nd03a1UJJWApgmLSjsppAr9VyOhRG1dGTkc
         K3Eb5KtIwE3vFcgcHob0PAYnPemE73CCe3ypCLaTGFApbY19uqb39MFUovwF32Vv6IlS
         SE6A==
X-Forwarded-Encrypted: i=1; AJvYcCVEElFQ99FM68GNCofSOfCcheX7t7hTENF43vV24d3czfxWDAQ57f3HdZLrjZ+P8YDrXXJLjqiUAFlX4ap5sRc1UYg6X+k/n59n
X-Gm-Message-State: AOJu0YyHAU75PnVyUC/X1PmK94AWJ/KNXnrce7C6hU60XZT8aoJfBCGp
	q8DL3K8UIEcTYkR2UxC81n9y1ykYTkDVV1+9wiJdronC4biCB3+yQQK28tc4PT/nKmZqzBYQWCD
	CA917LoFfRDxUTLFauU1LUkl85Ibj7WhOppmqFA==
X-Google-Smtp-Source: AGHT+IH/KQBHFp7cfJBihyPHNXUeZIXrpWHpjT5Yz8yFUhjBSqezUgduigKjzduYz++qkwRoe4y39Ba5yjD6sVnh/bE=
X-Received: by 2002:a05:6512:2c94:b0:52c:9e82:a971 with SMTP id
 2adb3069b0e04-5309b25a25bmr604398e87.7.1722027123520; Fri, 26 Jul 2024
 13:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722160022.454226-1-valentin.caron@foss.st.com> <20240722160022.454226-5-valentin.caron@foss.st.com>
In-Reply-To: <20240722160022.454226-5-valentin.caron@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Jul 2024 22:51:51 +0200
Message-ID: <CACRpkdaSb0T3ZH8+oQNHXddSg9gS-u+6-etggqNK36sNR7nN0Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rtc: stm32: add alarm A out feature
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 6:02=E2=80=AFPM Valentin Caron
<valentin.caron@foss.st.com> wrote:

> STM32 RTC can pulse some SOC pins when an RTC alarm expires.
> This patch adds this functionality for alarm A. The pulse can out on thre=
e
> pins RTC_OUT1, RTC_OUT2, RTC_OUT2_RMP (PC13, PB2, PI8 on stm32mp15)
> (PC13, PB2, PI1 on stm32mp13) (PC13, PF4/PF6, PI8 on stm32mp25).
>
> This patch only adds the functionality for devices which are using
> st,stm32mp1-rtc and st,stm32mp25-rtc compatible.
>
> Add "alarm-a" in pinmux functions.
>
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>

Looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

