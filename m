Return-Path: <linux-rtc+bounces-4741-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA53B3091F
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Aug 2025 00:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F344D4E6B42
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Aug 2025 22:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478052DAFC9;
	Thu, 21 Aug 2025 22:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HOoHi0Ui"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722F51E32CF
	for <linux-rtc@vger.kernel.org>; Thu, 21 Aug 2025 22:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755814900; cv=none; b=pABYc5le7vVC+UFLwrH0ntwCpx3AnGpS/Il6IfBQmacuSgpKqZyVZkHxr7gUnr/LcmfeMJl54ZqGbc62CBBJlO5VtO+v5yTgpCes7i3efp6xkfR/ZBhpImlT0n4nNMNbiP2Rhk7sxn8rIzj+3bIQSuHRGgXItO68e4FN7xkeUHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755814900; c=relaxed/simple;
	bh=UnLbFeNqq7avzDTdoROz1tobjhAOKS9cwykmPx2ktUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=boMosUxkqdl6bT8QVtzhSjfPai/rAj5WfS2DJTFsrZVsgfXZFgyEEcEjHKMpnzZ0QUZt7sZLyyTE6c+svXsPU0Cx5j4fPB3a7a+RHwbpBUMqPwBC5fKe+kRHiivEikzig4g+hblPB+r/HAyIx1yTO8UiMN5S1/vhZsZ5VKwZjdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HOoHi0Ui; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3364e92c1f4so3467251fa.1
        for <linux-rtc@vger.kernel.org>; Thu, 21 Aug 2025 15:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755814895; x=1756419695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnLbFeNqq7avzDTdoROz1tobjhAOKS9cwykmPx2ktUA=;
        b=HOoHi0UixxikYGIM53Wfyvnv2YaKUSYz5YLi1wHsj3zl05NSXHoRuJra3wXwYEG+bq
         6P6vuIyfvFkBl9W4J0bD+4caFmMQyXAAgO8rSKhadgN3o92KkzRAhKbbFQkRlcVthI2v
         Z+oxV75Al7p6/lZZLQ1bYxwuFAldhqsM7wwqWtMXMG3EqmhYY3oCuug+FyNArHmQ97N3
         mIpSLRnRtrExhKMQcgajGl/WOYpvvOUr/cnjTp3ezEq0OCZ4u7szarVn45AlqgSQglKD
         UOT3JWFhpISF+uHsZ0oHs3QTeYQTH/R8jiNE9uFtq6NkGOvD+mN0mXcUbyH9ywhCGJ38
         HwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755814895; x=1756419695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnLbFeNqq7avzDTdoROz1tobjhAOKS9cwykmPx2ktUA=;
        b=bGaT4cBb140wO6Oe70xBHE236sNPgMk0cjJ3fpElJpFibgIMVcReR3KizGztgwFIr5
         Diwt3QG510PbS2g7usRuTSl1HKVda3uFfMOkmhhcGIoG0fX9D7+8OFot4DFlvnH9/XnK
         HmASOtBP5Ed8+ofoC0dPhzEzjpIiuoPgmj3Ol54biJWhM5Rwt/85hRcv0XUUa4i7sWRP
         u7oreNiRPbjVxXA3iXjI1a4ChqznhYf0+Geo9/r1QfOmRQyYhuCKQ3bVLRARgzOhxPbl
         ejH8nY+xYguBITYXhs2HZLwKaieEYSQZzu9T13KxOcqtCpgaqtOL5mbXLa+wpMpL5hdZ
         LYAg==
X-Forwarded-Encrypted: i=1; AJvYcCWf82M7/FRn4PIr8iEwU/wnkGHI+91W+1CuGBsFqJ+fGFC4iO0FxLcXoyWSqrjddOFvI2H3R/iv5ew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/L2m4T29ckxykDfyKHK12fqU1Eb4Nh0uA5Ada+lEOos2tcZTx
	HSWlgBCdb755NNxpQUhNJcwiNjRCTaNBJoR532JYc1BeyTZMZlE+/SFV2mhvScvVcq/VK1mwDej
	PF24wBFpfQNjpY8u79GL9Lh2w0k8kogApqz1tSjvcQA==
X-Gm-Gg: ASbGncuxJ7VUrw3mEM9p5kqy8bVhxTI5nueKYaIeL4NPtC5u0Sxd6FPyJKpfx8qdflK
	1WmJvE1KlGSSbXKuH3N8uUfyNLWkvXmWmywlPbntS/iKt5aZLaRpNoV5qAkGLQq5AgRkNWNd1GX
	5Q8EUcBQfHuMIPIrGlzuM7zs/MVqP3RPq0NL+RgTZlXw0foMU4/jZaEvjeRFdCMmuQVPlj7S9if
	dpVne4=
X-Google-Smtp-Source: AGHT+IFS/hjiAZsrBtop5XCFciJi9eFP3IedOZuSAiBE+UQ71ZhxAO5GJMkg1G20lNwT1ii0tPrNlXvDS1ipWk+clGI=
X-Received: by 2002:a2e:a018:0:b0:330:d981:1755 with SMTP id
 38308e7fff4ca-33650de81e9mr2119481fa.6.1755814895432; Thu, 21 Aug 2025
 15:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821215703.869628-1-robh@kernel.org> <20250821215703.869628-2-robh@kernel.org>
In-Reply-To: <20250821215703.869628-2-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 00:21:24 +0200
X-Gm-Features: Ac12FXzKWiHUR0LNVTk-WVKUiLjwlocmimUVt0NrbbhUZa5VeD588kLhYF24RU4
Message-ID: <CACRpkdY5Oi6sM8i2OQFkSYUQ-Wwi4FTD3Q3uQ=C6BJyTo8FPKQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rtc: x1205: Fix Xicor X1205 vendor prefix
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 11:57=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> The vendor for the X1205 RTC is not Xircom, but Xicor which was acquired
> by Intersil. Since the I2C subsystem drops the vendor prefix for driver
> matching, the vendor prefix hasn't mattered.
>
> Fixes: 6875404fdb44 ("rtc: x1205: Add DT probing support")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

This should probably be tagged for stable since there is
a device tree using this (correct) compatible and it doesn't
probe right now.

Yours,
Linus Walleij

