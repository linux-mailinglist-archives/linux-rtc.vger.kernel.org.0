Return-Path: <linux-rtc+bounces-5034-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EFFBAF3A3
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Oct 2025 08:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AEDF17EDC7
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Oct 2025 06:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C102D7DEC;
	Wed,  1 Oct 2025 06:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WBmH2+ws"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB9726E16A
	for <linux-rtc@vger.kernel.org>; Wed,  1 Oct 2025 06:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759299866; cv=none; b=Fg5U2OkDBQZC8ZY7SbVCzHmh29ySXeAvPcEtLcFa3JypkaJbYmGSwRx52khNjiB756GtPedKTC2bU665qGRab0qAQaRM8QOKtk4LC1Nc2naK3Z30Fh0QboXyBZ1VVCxlIcxdsgHryGf7k3Yupk/A7e83RE5q08QiZaHzTnGFT5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759299866; c=relaxed/simple;
	bh=CRAgifSudG0wZpugBPM8hbg3tAFsd9BARcUmc0q8uy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FfiYtiBgqneUyIFnL5sOUPvgP8QetkCbjT20FIrE2Cwwz/qbTlaIUQqK0eHNFp58SBZvtmWk3/90wFkqfes3GAoeqCkq0f6KtKa2eQuF7+i3YW9m7viTfl0O3i3SmwFSamtnq7P+Zz59uXv3uCcHwj9SB83v9mC3/pIJe3sSt10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WBmH2+ws; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5797c8612b4so9592932e87.2
        for <linux-rtc@vger.kernel.org>; Tue, 30 Sep 2025 23:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759299862; x=1759904662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRAgifSudG0wZpugBPM8hbg3tAFsd9BARcUmc0q8uy0=;
        b=WBmH2+ws8/DDuBObE2cAr8KZ/24nrJYEIYCwS+M7mxGUmUwpdH3/oskZ2UqtynHEun
         RbP2kdtvDP7liHTY7D0oF7RdORfI+HqIrEG8bC1bkBIFgoD2/Yl/x8OXTx4msfQV7+Uk
         aDP0J/wwS1CbmxhR7grMGDhEqp5BmBP1Bp4mWug7YdxhUubT9IVlFfeuJTQY80jmRdrA
         5YHHFLH0shOZ380FYVXwdhKOUcs1cNa1/kiNTVBNP6rLHKXWICR2pWsScOd4Xr5LFCib
         l4CChbXU9ykn0RNwTi0ulhcAfrCw0uyxFXw/ntewc9zmIng2QDGIPBrCMdzMJa4HBkBB
         16sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759299862; x=1759904662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRAgifSudG0wZpugBPM8hbg3tAFsd9BARcUmc0q8uy0=;
        b=o5zHimyG3++/QUFjwNNhX+5zQMWg53NeeSzz4IU7Ry2tzNy8T7qWD7UjLvuVjY4y8D
         qnGGtm3r+272kFjM7TxYkADVwPAZn8RigM6GGiYdCypDz/4WPUlCqpjSl1buJl9r7VLs
         F+0NdDOblabnYRRVHzVRGWeN6ka+OfB+56NT5DGaft9YVMQXegIZYmOn9JgeWzlRAjgJ
         eWcJM8Qmk/O70kUQPJrqIXfWNCvMsByb1GeHexlzlwtHc6lV5OIObxL+r7tGRXiJGrLA
         nEx1zqrgf1WotApzgbL7WOS1AXBnmA91Ta+8bb5kjHC2WO16iCGWfFqNPynrDzQsHuXY
         OU3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+tPUlzzpNsphbpvCo5gG/8csWik8YYBHvDLcTYsgRPVzriCW5X7XLmR0OytVovL+JYFVwZrs6co0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjzkeWw514NxPzAaPtNvRLbvb4MxRbBxtiM9+H8GHPTgkDo76K
	/cOiZ63ZD1jTpjmFMTKodSpzVIMUx+vISvZ2HFu14sKYMiXBnVgq2/AVzrUdZ4VguKsqL8DLaOJ
	5yZUlMKy5mTiiMDAngI6wvFcqcvATeicVDpYTzaQleg==
X-Gm-Gg: ASbGncs9AZdJC/3/D4rK2HJE1mZz1ajJ1Ktd9WQLtYTtO5EDgYGqssp4CzYKcXzCD6q
	9CBCRBFM0EQ/RKIHehEQ6GoYbN3PtBQ2HN2ZWrpt8ud0V6UgFrFxpmfm7KbECZTLaAX7XjwxDyB
	E6Cyams1VT1kj7gDR2nkZ8jAZ5HqoOAQ6jyPQAvE5lNSTE2Di1v4nR5UROQVDejrDTQdfxXoyuE
	90QAguWpX7/HFXW15/SVABtNs8Idfs=
X-Google-Smtp-Source: AGHT+IFozN4lyb6vOpauqxIZ3ZLWPP665BWKXXa2eLUpNSUCsqO967pjOJIApkPryd/vgSxP+dQ4iOCA8lbPex5gtHE=
X-Received: by 2002:a05:6512:6c9:b0:57a:1818:480f with SMTP id
 2adb3069b0e04-58af9f6e9famr596020e87.46.1759299861855; Tue, 30 Sep 2025
 23:24:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org> <20250917-rda8810pl-drivers-v1-3-74866def1fe3@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-3-74866def1fe3@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 08:24:10 +0200
X-Gm-Features: AS18NWB7xcfQD0XZT5zZ03zQzwmaWFrlIYwfqVvy-IagezTBvTp7mSD81HURh8c
Message-ID: <CACRpkdbhTWtu1tvGQ-nY3phUeD8+0D2TmEQQUwDXhXS5thHn1g@mail.gmail.com>
Subject: Re: [PATCH 03/25] dt-bindings: gpio: rda: Make interrupts optional
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 10:09=E2=80=AFPM Dang Huynh <dang.huynh@mainlining.=
org> wrote:

> The GPIO controller from the modem does not have an interrupt.
>
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>

Can you split out the GPIO patches (like the 3? of them?)
into it's own series and send them separately? They seem
to be possible to review and apply separately.

Yours,
Linus Walleij

