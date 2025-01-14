Return-Path: <linux-rtc+bounces-2910-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B01A10673
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jan 2025 13:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F206164A95
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jan 2025 12:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853DB234CF4;
	Tue, 14 Jan 2025 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qdHQrtqe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F5420F98D
	for <linux-rtc@vger.kernel.org>; Tue, 14 Jan 2025 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736857038; cv=none; b=kKqQjvsLmGfNFITH/Lcaz7otW2EjeAB7KP8RgLi5TTvEbJuptaW+7Dpswlqu+RGXFDUcS1ea5Od0IUqEDl/c5/+h8kZTH3NZgyLiIa2sRDbBATMeMCN3mCWEye1g+zQE1aDqJGArHQ2vLQdMKhCwMA0bAYEJfMjOVPXcU6tKEds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736857038; c=relaxed/simple;
	bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvxwxnaLgmspj63rob7e4/1orxV2eNOMA7nS1JR3hMfe9ivNkWMzY2RXwa+ps7ZSDUMFLNpubm1Ce1UolUgSjpq5vq98dYitWGi26HAQDPRUDe4CFNFBcnMUznKcfWmGHoaetzkWB+Ybg5nBqDiOJRlJT2V3qlSJvy5+4PGkMXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qdHQrtqe; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so4231351e87.1
        for <linux-rtc@vger.kernel.org>; Tue, 14 Jan 2025 04:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736857035; x=1737461835; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=;
        b=qdHQrtqeqnAhe09KLETFGSkDMQv5jTwlECLYrdCpML+BDUAu4hv3V+dz2s/C/dTQm/
         qRrExopeKyFBXre2BxAocM+XqmLaXrOr07YAyA3ZfuqJAwaO66u8evVZHlTCb8xKNToO
         oX0yPj/t7D1IPRTc9zj2ymBwzwpDYx5f/C2OAGQRtVrmmgG5Oy/lkvFnQHDIMrSiEeOp
         G7rqcuTLmWDEI/aD2ABQdlC11DiJfjWMgZtZmhJny/LWeP+ODbTdNm5O7a9xc5KyyN+L
         c2Xo5Z6b07WciVrpxCXaR0eQwW5HymUGzIoLN1iG4E5NSaZ1uaoChd8j4w7xhx2MMmRY
         gcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736857035; x=1737461835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=;
        b=jC3MAJn4vscYwtoNYmtCV0pCyqG41GXPouFdL50t7XSmOqwmldnSZ9PvDgmywT7XZ+
         peTkBsSMyFeOFNB0ktmA55MC6m/yERvjgyRvcjhCDROC5SWgI5pMrDAt68NCzzDZvmso
         /aTsd0hMqXBxlEIQ76oegm+RqgOSZoUZXDrS33BU6CPsIowFW49qtC7CvYmOD4PUuhxY
         W+yNzU2ZkHjZQgOLKqXzEkYM33IsWrSgVteFG6cxKDakrKoqra2qvLI58XOQ/g6wrEu0
         wOICjdukl41cO6X8ymXCpALYRf9a21pCqw3rsc4GiVK1W1wOqyoSuT8YtumiKH/rvAYm
         NfIg==
X-Forwarded-Encrypted: i=1; AJvYcCXyJ1xt9+H0zFEwvBUVW2/47j6RdDyOzJtbhOiIOdBzTOveZlsVfm/0YlMnoxiw2VcCm/FSXvmwEi4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzat/bOj1/yzyhGYO+SZHTCzrj1I9TboyRu6rSpZQOTPIGevQMk
	mASySgIOhYbhBSFTt/Z+ELaV+FViEMabZBbzkKFiJ5eTnbvFKQuZYYY76WKqyRBvmGEii+aiTkJ
	t/8L9hfCyrINFmW4X+PTWZgdrmv457ik47PIrig==
X-Gm-Gg: ASbGncsEosZsOlK8KlhktIXHQxpRvmlWj0WhEP/HWE7wup42ighIhbfCFmlFWQV90No
	UqbIwe3QglyjusaGZeInC0/7SRdtLj6oCUwGX
X-Google-Smtp-Source: AGHT+IG/nVzJ4usllSB7WeL3esJ0/+hz1rQx2YNWDFn17mueoKalfz6Uj0tzGOzfhZRqk49pDpDqslNG3Jdx7c4EaqI=
X-Received: by 2002:a05:6512:b97:b0:542:986b:de08 with SMTP id
 2adb3069b0e04-542986be0a1mr3961478e87.26.1736857034594; Tue, 14 Jan 2025
 04:17:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com> <20250103-wake_irq-v2-9-e3aeff5e9966@nxp.com>
In-Reply-To: <20250103-wake_irq-v2-9-e3aeff5e9966@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 13:17:03 +0100
X-Gm-Features: AbW1kvYSSgagqOIiggVP1rEX84eySXcyOvS8Yel1NcZ50o6oIQlw1NaD7KnQIZM
Message-ID: <CACRpkdbFtLhGXwSbCF+v54eEdm0w=sDsseUPiRfc=xmak-DbhQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] rtc: pm8xxx: Use devm_pm_set_wake_irq
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 9:42=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use devm_pm_set_wake_irq, then the 'driver.remove()' could be cleaned up.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

