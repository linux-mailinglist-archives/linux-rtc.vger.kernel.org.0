Return-Path: <linux-rtc+bounces-1253-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 330D68FD5EB
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2024 20:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39D1D2834D1
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2024 18:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7387DF78;
	Wed,  5 Jun 2024 18:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0/r9qNF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF5E7345D
	for <linux-rtc@vger.kernel.org>; Wed,  5 Jun 2024 18:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717612903; cv=none; b=Gvvjid2M3ZIjmpk8fcIulL3Eu8I6LYbF2b8ZAJ8gCOfKW1NjncW/9kHgh8tp0E5JSowY40nudkTz+3UxAFbSFjzY5zOtG7YNvRGiafsdcvhptmncS/7yzc8aWs17JumXf/+fE7lTs1VprcV6SPMOQqSso5WK+05MirW6hcOBozU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717612903; c=relaxed/simple;
	bh=DDr/3t0lwFc81BtXgTd11Zip3oqzPq4mI3M0eue9KG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0tSz2dADl0S3IcDpvvcIeo5MmHc/mtlcPfu53pbJ7zULY/FIcqSHmdut6gOAMQ0GNBBYH4pcbHrQPAHO5I65rIWeYr3l7wVBcbmWCjJCTvwQgAACAOeiQmYv+SuaY+2t0RhfMo0lq3uPYiwHNqvpRYLNt0hoEo5pkUBYK4w8gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0/r9qNF; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a68ca4d6545so20548366b.0
        for <linux-rtc@vger.kernel.org>; Wed, 05 Jun 2024 11:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717612900; x=1718217700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6m6zvPNCONgOQ02t56icemdM8C22VgqfCNng4SRsow=;
        b=P0/r9qNFrsfBsl32s5vEjxU0FW072yAyYSTFCj+qdpmfHoX19iR8kuKvcBiqFqS5v/
         guE3VfCGAbPYGFz2yQJSvSKHnSHfqm8ILsTxrjJWLVst09e6ERPHpdyhjTE1titZ16qv
         Hwy8kYNOwpaSqfBo9pQJ7ruXVNGxCkxzy90rJSDPGepVg9k+aGN/H0Ssn9snz5rztHtb
         EpDCls3D6LakXKl69apdIYNMxIJUsZqqoPG7mb6opZaOWYz8dgyH0+iPE7q+efJgXhWN
         jGtDrS/PDWejUPJ1NUhpD9UWbEe7qncM4GeDWA+zgASvEmyqNhumxs9/xLaS/5VVRHXZ
         aotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717612900; x=1718217700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6m6zvPNCONgOQ02t56icemdM8C22VgqfCNng4SRsow=;
        b=L1mFLCMFjsdeWrSFUNqs9aE7OFr4MTwGtqgjehMaILgj5mq6NxBsJOUt/6K8BOraWl
         DIIZKb7UcDJwNB3OvzqvuVP0nRL3y9EKpTEjt7v9MiXk5LlvAS+PenRtSMgP4IH0fsFn
         V4beolyzredY2yhPFYNtqqit+OzPO0MHZXGUvv/ghd5VsLNiTageQJoMMgDcekQUBcab
         0ce2B5nrBiKl2roqhLpNT9tjzoTHezDdiEw5tCnVjV/NKlhICQeAyYP8gXg5Mj2bm197
         b/V2Dmr9Kzz8fzryG19wZg/V8/qu1AzbInFmdsst2h+Q+2z+H++izHA4VYpDScJmj0Hh
         K8zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE4m05d9cPk5gZV9NoNvhD/HUcY3jojk9BZTBWvQVYRlzfq6E2Hp61PgA8R4lwpfxOqTN3apgraHlXDaYx6M0tC5U5Ya6L5m33
X-Gm-Message-State: AOJu0Yz8R7AS5OrvgbkXWpH33AD/wjczjoWhpBm5btadO3GKc+zFnq7s
	X2YrsZACkQN4MGXrhjvA//f/OxukvhV9UYR78yc1b+wohQc6DJtNThlklRjlAhcvi9/kwBqhXEm
	RGuGhqlN9aU4NctZlVl/Sgz+CwVI=
X-Google-Smtp-Source: AGHT+IGML0Cuh1nuv/mQ8qwMO6N4gEQXI+dqsnRoa+DNPnaGOGNLTi2rLSCqdTEc9SKpCcVojKqkjGR5jjRi4vR8Quc=
X-Received: by 2002:a17:906:f984:b0:a59:a85c:a5ca with SMTP id
 a640c23a62f3a-a6c75f941ebmr41888666b.7.1717612900050; Wed, 05 Jun 2024
 11:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605161851.13911-1-kabel@kernel.org> <20240605161851.13911-5-kabel@kernel.org>
In-Reply-To: <20240605161851.13911-5-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Jun 2024 21:41:04 +0300
Message-ID: <CAHp75Vcdd2LCbiiQj=ejGbOWSun-EfodDKmhr-Y0XcTZ22a4KA@mail.gmail.com>
Subject: Re: [PATCH v11 4/8] platform: cznic: turris-omnia-mcu: Add support
 for poweroff and wakeup
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
>
> Add support for true board poweroff (MCU can disable all unnecessary
> voltage regulators) and wakeup at a specified time, implemented via a
> RTC driver so that the rtcwake utility can be used to configure it.

...

> +#include <linux/crc32.h>
> +#include <linux/delay.h>

+ device.h
+ err.h

> +#include <linux/i2c.h>

+ kstrtox.h

> +#include <linux/reboot.h>
> +#include <linux/rtc.h>
> +#include <linux/sysfs.h>

> +#include <linux/turris-omnia-mcu-interface.h>

As per other patches.

> +#include <linux/types.h>
> +
> +#include "turris-omnia-mcu.h"

...

> +       struct device *dev =3D kobj_to_dev(kobj);

Is this declared in device.h or elsewhere?

...

> +#include <linux/rtc.h>

I don't see you need it.
Just

struct rtc_device;

should suffice.

>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  #include <asm/byteorder.h>
> +#include <asm/unaligned.h>

...

With the above being addressed, LGTM, FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

