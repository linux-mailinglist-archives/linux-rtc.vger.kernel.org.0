Return-Path: <linux-rtc+bounces-2803-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 044619FDC6E
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Dec 2024 23:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F23FE7A034F
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Dec 2024 22:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0247216F288;
	Sat, 28 Dec 2024 22:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jmdnptxK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED9513B280
	for <linux-rtc@vger.kernel.org>; Sat, 28 Dec 2024 22:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735426524; cv=none; b=o1VmjASkJ3/GzkffdiRo30a7WyFqa7P8JDNy3lNMHoM6NkMxwr24n2XeWsXnv/XdezaoAg7PeBy3m9CEsZg29CDUiM/trjrBEDpYXPAWsp8ycamxVSWlAKfIAmxcm0XP6OIJTIno1fNNsLyhgiVqgfajDSSGshV5Qm00oyCWQLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735426524; c=relaxed/simple;
	bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j77Fs1eSRc22Wp49F/Mc1534bBq100qJuqp7Ry/9cMFvB1kf00Bn3MOHjMgcZekyoqYaQIjTTmOIEURTfEhMOnhbeffRyfiHmQQfAK7p1xD6eP2Vb3HlpoMM2XbhE4mNCNU1Dw16j+w8WKxBvA5hc5eOLVMRyBPXMQeeWVOvoV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jmdnptxK; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3a227b82so7822628e87.0
        for <linux-rtc@vger.kernel.org>; Sat, 28 Dec 2024 14:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735426521; x=1736031321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=;
        b=jmdnptxKkl79Plu61bNDKEEMlk/nTlELUMqzvaFPUB8R/4+9oxKPERsZQmGTYsGuT8
         1vUu739fLVz7Mr/w8UkBvMy0f6o/X08kUqwMTJ2t2AyZslb5tcNIPUwkLFx7uKw24CA+
         WfXOzAVZlxupAqc8I+rKVfrWg7/3IxDXfWVOHmHf/X+2vKcghnbVKheTWRVcfPn2RwgQ
         UV8E97tFta2OMrFHtfJbfGjHCLVD4nTyEpAX9yI267YsgOZedWcXAofISxUU8WTmujpX
         E4c2RARwbv2YrTIAdz2UnOdo4lRe0b3PLXtj0lOpqlN965JrDzs40otT42Za+OR6nx/a
         tQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735426521; x=1736031321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=;
        b=QZDldR3dQJ0HGlUSWKbjpL8c99REn3F6RL0ZLRKosCHFzMCevEcwTU9O6J89DMMqfr
         OBehYSYjlT3bMqIxLC/OKwjLlrNY09S4VsydeHLkv1/LTkwOPY9MX3IoURiOcoDA0jpX
         ZE12MabQEIn7nK9ZY74xbJ7C+X7vrsODLe9clMZrbxiyK4Z4vbqTPW0LrtUbX0ot/BB8
         VBiKMsk19EtEfsPDUayHvh8xdEMG6f5ofneMsy4/aIf3BdSuloVCtuC/6CT+SsIY3oUv
         rD4CIfR63T5lyz4hHaYjWG3TU4Pj1HK1dQRIZe8gjBxNpPNWz/JMEZDI8e4BR/QxeVJX
         uRpg==
X-Forwarded-Encrypted: i=1; AJvYcCU+v0JciHClypg+kjDZf4AyKwA7cy7n2INyek9IK/bWgOBDWxkMI508U3wRIu15kRAubeZnXLQtqag=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5hR2pIEXHbLbB6+4U8xZjb8xvP4UQZOwQTqyl37+rghFO0g8W
	W4FEJBj5mAuxoq6eiambWXlLRYx8md+0WZHLp5kVM6bFbYeU+IuYe+oypvjMDu3m+OF2+9WVE6+
	KKwkne8jbpuzN/VMVgLbMfaUplIUkg8o16SQGAw==
X-Gm-Gg: ASbGncsBiczgD/hQaaoXXLOrm04KDkWmUpiZshza+8TrX3C3DkXr2iOF7P2YhitSbBr
	TrZfLhbWm6V3DsjLfyOc+i4V3R3HglbvCSBOp
X-Google-Smtp-Source: AGHT+IEeHS7qBCOkGJkLci2K1l4MO3cQjjPsp4mJA4mp2Fct0kochwX6HgM8ASkaZLPLeUe5QHN30KZL6jeoExuit3I=
X-Received: by 2002:a05:6512:ba6:b0:540:2160:ade3 with SMTP id
 2adb3069b0e04-5422953c19cmr7875781e87.25.1735426521162; Sat, 28 Dec 2024
 14:55:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com> <20241228-wake_irq-v1-10-09cfca77cd47@nxp.com>
In-Reply-To: <20241228-wake_irq-v1-10-09cfca77cd47@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 28 Dec 2024 23:55:10 +0100
Message-ID: <CACRpkdYaWTdOoLXcpWG92+OyRwsPMxMbhQ6djdzO07x0sPz4oQ@mail.gmail.com>
Subject: Re: [PATCH 10/12] rtc: ab8500: Use resource managed API to simplify code
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

On Sat, Dec 28, 2024 at 2:16=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use devm_pm_set_wake_irq and devm_device_init_wakeup to cleanup the
> error handling code and 'driver.remove()' hook.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

This looks very nice provided the core code is merged.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

