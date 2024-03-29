Return-Path: <linux-rtc+bounces-944-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FD0892698
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 23:06:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0004B1C210E3
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 22:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607CE13CF8F;
	Fri, 29 Mar 2024 22:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FNMSbUHl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B632C13CC77
	for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 22:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711749976; cv=none; b=GDi+Wu3EaSCHf60JxeM8KYaKaAQYuUS40TH74tM4o2iPHlRV0w4gPJ2DxNyeeDixqiqFIy9WRjsPrLYYrHlzk+1jRP4zjeyYhxGzeTcBl+wAV9UxffKeh7tQ2M7vmP8oOomCQC4BSq8IjEJEp48EOt41SPnMhyeNR27Ebki1uVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711749976; c=relaxed/simple;
	bh=nV9Xa3IM7xgXhYdWwGJomDhP7UDLqK2glvaaFhOjZe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n13N43odoYuCzTmYaBwUmxENa7cY9Uta6tVHA6ohK0OmM4aJP/TA9n4w+3cqZ7W+feh/QgCAHPRA33RNspWKlEOi80ZxZpVTxdmO7DOrMNUov7C4Kzj38jtFLieS93MGKjRa02cjSwXSmtxXnRj4RuFYUl4LfCV2wZT2Wgs/ZnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FNMSbUHl; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-69699fecccdso13290816d6.1
        for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 15:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711749973; x=1712354773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nV9Xa3IM7xgXhYdWwGJomDhP7UDLqK2glvaaFhOjZe8=;
        b=FNMSbUHleaOxOZbfDz+u+JdTia9GOPSlzizapSlBoIwxoNPZMUISRqeSed3IryVc49
         Ygiseu/iCAeP9awl3iD9BF/d4uzNj+NdUsSPmi4P3WfcWpSIkepTUCzY/TGZdGMztfXp
         j0BQevPRTm9lzQDXUTpr0NKeqgBGK80Syje3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711749973; x=1712354773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nV9Xa3IM7xgXhYdWwGJomDhP7UDLqK2glvaaFhOjZe8=;
        b=AAI92my5Q2UpSbV5c2GWDoqPtGH6Xwno+k1Xn+fN/viMQd1UdBEdZcF/bkPjkdarRD
         SxTzuyMA58YXfFJMyf8tTu4ikKNVVubY+ffzjD4DedAxg5b82/s3iKtfI0rI0KV0g9kp
         iCbkkpReDSw4qfnUAqfwAjYab789Zs2mc2z2LzixUXqC4qp6wCMOy9dScIjSYF2UbKGP
         XwDojEEmZsl/Fc493DGqTPj3Rir+9Hjg+MnXBB2HLz3J10wRrHwaKsiwG1xhvLzIJn04
         EZgcarkwwvGuXEX+M1Nv73qgQUm+Pcj1i5J7yTQryyC/WvB8clHgHxEYak2cyRmIhWoJ
         OM6w==
X-Forwarded-Encrypted: i=1; AJvYcCVIp2QZ78LnYU4VL6EgaW4F2ys7eAlR4hVSmnu8GAMQekpW5puu6ETfwUcxL3iOW2hax7RZIGG6490Cf1E/k8xDj8gLncRJgQx4
X-Gm-Message-State: AOJu0Ywon3QFojkScUmkS75nu27331xKwbHP/w8feKX+2tWetC3BDSx4
	Juis+yas9P+cirNR/+VExL5PhKZz/h3YYUztE7mp+RGzURDgVnD8XjuLSulPclMMs/2A6/f5Qio
	knQEEx6UIK+Ruiyb+aNY1M6g8gqzZ1VkSEwLb
X-Google-Smtp-Source: AGHT+IGSnhH3MvM5RwIbbS/34YE/7xYi4pOWO8e61L6VZDx1cFIdeGebuznubPkOzyANMTrrgX6Bab4sJhaJDC2rdVI=
X-Received: by 2002:a0c:e852:0:b0:698:e87c:7d65 with SMTP id
 l18-20020a0ce852000000b00698e87c7d65mr3221235qvo.37.1711749973661; Fri, 29
 Mar 2024 15:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240329075630.2069474-1-tzungbi@kernel.org> <20240329075630.2069474-8-tzungbi@kernel.org>
In-Reply-To: <20240329075630.2069474-8-tzungbi@kernel.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Fri, 29 Mar 2024 15:06:02 -0700
Message-ID: <CACeCKaduUSrPG7w6hi=SPLwPjdJ31-9peHtyWwkitAhkQaxQHA@mail.gmail.com>
Subject: Re: [PATCH 07/18] platform/chrome: cros_usbpd_notify: provide ID
 table for avoiding fallback match
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org, sre@kernel.org, 
	alexandre.belloni@bootlin.com, chrome-platform@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 12:57=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
Acked-by: Prashant Malani <pmalani@chromium.org>

