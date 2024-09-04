Return-Path: <linux-rtc+bounces-1875-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 097A896C11C
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Sep 2024 16:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45AA7B20D54
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Sep 2024 14:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68021DA2FD;
	Wed,  4 Sep 2024 14:47:16 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C0426AED;
	Wed,  4 Sep 2024 14:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461236; cv=none; b=c1WwcVdQrxIOeL+sIMUlniwfllciJQxEawVaz3zySP5YvIvcLIdQ9zfvAnSggoEU/1dMptpAgVzIpAuRFz9MPzaxyh+SiTy0a7C9u5+1pdISkcQceTe4xcnecFLVfKbpI67CwFy71iU2cbZ+z9znnb9iSG9rMS07ZLo0xUZ2XLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461236; c=relaxed/simple;
	bh=AKet6FBn6erAGoQQYdu36m7bdCrh3rvMBwarDpAMcrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nFEHlB+enhoi8iaIX4rXD9UVd3Qnp5znMyXU4C/rkrUlSoIPSba0bT8SnSGxKcGAYcd8dPEka1KqH1vUjo20NrctqV4cbL8tMguvPI1P+ZXojaLzGTCnaJrLiwvv/1aCuV9pBSqaTGcJKXF3Kqk9sApQeooRqT00JsXQcN9bgg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f409c87b07so85498511fa.0;
        Wed, 04 Sep 2024 07:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461232; x=1726066032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AKet6FBn6erAGoQQYdu36m7bdCrh3rvMBwarDpAMcrk=;
        b=Z9QvfR2ZJEjdabaU1fe/UKOg7Ku8LKaZC59oDU9ZmJ5wmBGp/6HPnSvlaoES+PXU96
         n9qE2HJDMjYw8kdByzitGYaiYjDW69G5/GgWTT5+nGAopQdhxBki07hM2vHsWAIjWHXT
         N/rEMVMapPS6YeKkvq9HHVPq1Siq5Om9FKiCMHRELhFXPNoyZjaNS4AuSQGnuaCgLgwL
         /HznCCB2OON2GUjSaXzOVr/yE1wkR5vgBKxnXaOeLvF1ZnnAe4VC/Wsvq03715JZCpDZ
         jzmE9H8ew3nZoluHJEfO0HQq/Rq8iNbQ6KIeiwgU9+dDCDt3uF3aLjMmEzYysszr0F2e
         bwWw==
X-Forwarded-Encrypted: i=1; AJvYcCU3Kv6tDMFaJVJFVtHbEnmGX+kRJa1XcAYYPMafNU6dcyUWidbD9s7u9FXL7Ibc0R+OO/WDlF519fxe@vger.kernel.org, AJvYcCXV4PADS9MwMgGFqnKwH948jNra3MyQmNMEUfzjORWK0BwmgtqF8096i7nPnkVk/JaA+4wZ3dXpjQXtwyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXjSkA4AKAYBCWDHYMk3c0dXt393HVO8UzYM+UR2mbIpGTsi5N
	qY7ffLMypZsWyBf8Bexd+8Pod7rYzkojoMxx7SQ4yBTDiqH9kcJEMNKExoWA
X-Google-Smtp-Source: AGHT+IFgHtRvCcjHvQ9ujMjU3x5BIGydGDr6ZD3YCgJqy8xeKbeSNLstFPzSCZ7hi8q9WTgnxBmauw==
X-Received: by 2002:a05:6512:2214:b0:533:47ca:9773 with SMTP id 2adb3069b0e04-53546bb84d8mr12533396e87.57.1725461230571;
        Wed, 04 Sep 2024 07:47:10 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084d879sm2387334e87.257.2024.09.04.07.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 07:47:10 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f4f505118fso75494351fa.3;
        Wed, 04 Sep 2024 07:47:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/SlIhMbKebZIYxanRazU0j+KFC5gSOiasLQNca00wy6rQoUQ/iixFYdp72wLRqMlSmF2U4uYNgLfm@vger.kernel.org, AJvYcCWc2dxqFg3gXc38VstpuK9TvbJeP1tKpbCL6MVsQA0gCVZinTZnKeikptSdrCs6IAKbSR1+tzVRzW1iMDY=@vger.kernel.org
X-Received: by 2002:a05:651c:4cb:b0:2f6:2858:a0b4 with SMTP id
 38308e7fff4ca-2f62858a308mr101592101fa.19.1725461230260; Wed, 04 Sep 2024
 07:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730194905.2587202-1-mwalle@kernel.org>
In-Reply-To: <20240730194905.2587202-1-mwalle@kernel.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 4 Sep 2024 22:46:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v64SCQbfW=kKU5306fk8MrhBtsjpXX1YaWsXHV5fso-dcA@mail.gmail.com>
Message-ID: <CAGb2v64SCQbfW=kKU5306fk8MrhBtsjpXX1YaWsXHV5fso-dcA@mail.gmail.com>
Subject: Re: [PATCH] rtc: sun6i: disable automatic clock input switching
To: Michael Walle <mwalle@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 3:49=E2=80=AFAM Michael Walle <mwalle@kernel.org> w=
rote:
>
> The V3(s) will detect a valid external low frequency clock and if it is
> not present will automatically switch to the internal one. This might
> hide bugs and (hardware) configuration errors. It's even worse because
> the internal RTC runs significantly slower (32.000Hz vs 32.768Hz).
> Fortunately for us, the V3(s) has an (undocumented) bypass of this
> switching and the driver already supports it by setting the
> .has_auto_swt flag.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>

