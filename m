Return-Path: <linux-rtc+bounces-3495-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4057AA60ED7
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 11:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DBED17135C
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 10:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48A91F4630;
	Fri, 14 Mar 2025 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jq0KWvbC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFAE1F418C
	for <linux-rtc@vger.kernel.org>; Fri, 14 Mar 2025 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741948098; cv=none; b=BKs7PJ0byQe1l/GTeWLtvNdlQh3B9vX5iPgHnEOm+aNBYeMCP8W5OAV3ggJ5RZVLMUGT7XoOLfQPZK069nftF/RuUb7sUSCExcg+AyqqWP479tIpyyQpxtdOeJRDTQ47/f+62P9JW6v0rmZX2eTvl+QK2VrsHPY5mQCnG/CVjvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741948098; c=relaxed/simple;
	bh=7lhUJ6eiiWP9IJ/FYhzjbXh+LAJRJWyTLSUXs2Uq9+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LgpR2VibCnXYRI678X827BktMxsJGspsc6jiiprQait1E/1G4dqA/aOqGkZumYuSAjq2C4PpJzMFq/qIT2TDMFpfJJ+vR9GF6wmehgP1Stem8S4AJROwQLatKezfmBDYCQ9PC11t+PDm5oAzfgFm6WSjtlNrXclP7F3BnH8J2g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jq0KWvbC; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-549967c72bcso2192238e87.3
        for <linux-rtc@vger.kernel.org>; Fri, 14 Mar 2025 03:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741948093; x=1742552893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lhUJ6eiiWP9IJ/FYhzjbXh+LAJRJWyTLSUXs2Uq9+Y=;
        b=Jq0KWvbC+RGapBxE/79RV0BIeD9VvGdw1Fpe1TB3FQiE3Mx7M1ug74I43skmk/ysed
         pW0eyKCVeuPLLFbAr8/7rZaVq+ypvWIqqp98ONbAm/K0er06k802QP0sKmwApc01jN5E
         LJkRPCM7GjMxbAZVdkkbB+WFpnQ3yeovdkzSGgBhRM8hxbnIqo7S1fIfuHXiO9Srwm6f
         0krXnLDsipucb1cr4hOpq8EflJ5+JkQWavCGVohox/GL31nKFJGEb3tY1JskSboySuXw
         evvwW11mE8FMNJVAwglnLWQuelsD1w2tLYtm1nHAHAZQlQ3gbq3yJ1khhhuBRD+qlb/f
         Bh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948093; x=1742552893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lhUJ6eiiWP9IJ/FYhzjbXh+LAJRJWyTLSUXs2Uq9+Y=;
        b=u7SdDzs04UwQHQnd4Q/RwukofcHuZTi197tfaWIQV9oUfnG/wrERmjQHqzVO0pt6Ku
         A1Eb+RLSPBa50wiRgK/7eOW7iGFc5tf3b+8QIlCaZjqr7b+6Ps6TtYGFhhyqfLvaDZbD
         Hp4jn34eCY5klDQbEpu69lf3BAZN1uGvD390qq0i7cfG/pJeFz6ZLnMXIBdgfunQ/3/B
         2qx0KMLSYHrykTJAwrVOq6OrNZs7X87zJxgPLFjGBGxYNA2wjgO6BSjiitM7aq9aFyJY
         0zBhAVnvNEkSA3vGNvHylFy9bKV+r5ndbQi9LPADKtUnY+MAWz+ez8ALBVnjJj94hjPz
         MB0g==
X-Forwarded-Encrypted: i=1; AJvYcCXgQofbUFAw01TkvXB1sJGEC6cRAmbfnFovj1Gsq4TFQbiMmZRbMUO/AGoUzuXBXqToWtI7zFv161Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9WkqFRyUtR8DVwQB9f+SnFpvQjP1TUoszzEH5ZMzejp6+yWXQ
	t3GQBqVWxv0xtyVJjl+sF3ZLzH/BSWaMyTE5+3dlU69KNgfiSv+JP7QoX6xjg9bImFuC4hdah7E
	L7ARGp6ZFq/C8q5pohWlLbSoj+nUw3R4FQNAuag==
X-Gm-Gg: ASbGnctUXMu1ffPFrlw7GftyMdfUuJZ9sFsjgfOsaCOz6+bpXaPBUtMH9xOwUMhCpcd
	kgNfDmgL9QcI2/Oc9lVcDtrdl9F+r22jaZQQhbYaOGVzm1zMKVaVUlp8+6ylxXN1YfLGzhG5VBz
	1cz4Q5PXfJC++37rA6ByA8TS0=
X-Google-Smtp-Source: AGHT+IEn/Zc2evX7ABWKYXK/Rs9IfMZdPR9tSjfOKy1a8kRLZcgdXcqx09hfLow4+l9JiJIqttYJQGRGb5b/H78iKJ8=
X-Received: by 2002:a05:6512:3087:b0:549:7330:6a5a with SMTP id
 2adb3069b0e04-549c3913d63mr621103e87.23.1741948093287; Fri, 14 Mar 2025
 03:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250309193612.251929-1-linux@treblig.org> <20250309193612.251929-5-linux@treblig.org>
In-Reply-To: <20250309193612.251929-5-linux@treblig.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:28:02 +0100
X-Gm-Features: AQ5f1Jo6nSq2AFqXUDepXvu8J8Xduf-drgRoP8FzPPUsiMaA2xVOQZlsv65trtc
Message-ID: <CACRpkdY2oZtu4vtTwHRMFxaoYWu3B5bfPN==thz=BT2F6BHQQw@mail.gmail.com>
Subject: Re: [PATCH 4/9] mfd: pcF50633-gpio: Remove
To: linux@treblig.org
Cc: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com, sre@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com, 
	danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de, brgl@bgdev.pl, 
	tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 9, 2025 at 8:36=E2=80=AFPM <linux@treblig.org> wrote:

> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> The pcf50633 was used as part of the OpenMoko devices but
> the support for its main chip was recently removed in:
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
>
> See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

