Return-Path: <linux-rtc+bounces-3708-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BB3A76396
	for <lists+linux-rtc@lfdr.de>; Mon, 31 Mar 2025 11:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC6CC188A7C6
	for <lists+linux-rtc@lfdr.de>; Mon, 31 Mar 2025 09:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE1B1DEFE7;
	Mon, 31 Mar 2025 09:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUU6uazw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264CE1DE887
	for <linux-rtc@vger.kernel.org>; Mon, 31 Mar 2025 09:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743414625; cv=none; b=ejeQkQa0P97bBTd1RPzDNRlDGW71GItayoLMY0rImHgKSAhSpBB1Nb5zDXFMaTV4uQYbTEFb0h02/5lu5aJikR5Py9jKNvFNGLpdR9n0qxmdIZH2bjTRrF0n25wdOqwQAUA1XRSfNJAh3iY2pzEx6ZZu50OBOD5qhiD59EgPsjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743414625; c=relaxed/simple;
	bh=WfQTWTf6PwJHc84otuP/3Oag7lcNdI1Qagn5HFWHEVA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mNPb0atcGe4DR3dHLDG/cQRp8B9ouDpVPLZcXn/CF9uF0hVKLikKob9weI+3gVSlvPwUNiFGPV541PYqnjdZKY+5gJsXshtrUImesDYdjZMggdQw7yViv91cTn3TUdOiK1v6seTn+bqtvz0CJRPCwHHSCU0WI/oCHsxP9xoVp9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUU6uazw; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso4082934f8f.0
        for <linux-rtc@vger.kernel.org>; Mon, 31 Mar 2025 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743414621; x=1744019421; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WfQTWTf6PwJHc84otuP/3Oag7lcNdI1Qagn5HFWHEVA=;
        b=sUU6uazwkA8HHrSIhWW0uNQTB0VUfOY2iGiD1yr3zKrJq6Q5qz6eJD2ixgC6PhSW20
         h7JbOgEGrXvNmf4uwQJRL19QH+U/v6LzXmlbrM6dK/nO8rklxpZjjXk+OYy8vO/z7BwV
         qFijTuMGEE4MK22fGGoACtnhOObmOubIOMXev5K5lRIlkTzfnltNisDwVv1j1X5/qA3G
         EC/lTyZDPlKHNOCR0hZFl1CeUbBGsjILXNp+Qu5QcOEIuZzJNeLHUjcIClNURtbWaIX1
         DrGqTbzGSGgjWTKjZgYqSw7dJCGvPZNz6cT9xvUF0NfZcQOyx6qQdspn7zLxemIWAJav
         hFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743414621; x=1744019421;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WfQTWTf6PwJHc84otuP/3Oag7lcNdI1Qagn5HFWHEVA=;
        b=RSEKeyzZpMGiZCwKhz6Oom/nH9Ij13tFwoDKcM0gBeohRtRg0n46RBX0M8pcmI0yGn
         uLso5C5ncNxROS4jEwAa1/i87vUGwm7OPYHVjdZmI7Vcxsq5v/YG9S9zyjU1wT/Zxfzo
         TJA86LiUeUfRVFWnmcPEIlg3jP5a+osfxYf7R5hfJxslpdC4VktBw2icNFIEW2qAcLzS
         Lzll+YYcGse3KD/6YLdz3S9VGgKSvFuywf/+KLbgx2H+V6xMXJXtBSyErbk8dyvpuTDy
         NRIyou2xT7l9/d6Su5tCc79XqB+0B3WGjGRneZ7r2negasggMPq0jJKAisK86PpuJDUN
         us3g==
X-Forwarded-Encrypted: i=1; AJvYcCUEJW0sb9s4/3wKjjxh2GDWFrCopnuBO6ElJakJKF8zh1WxfMNlQO+knXYstNRpaVHxHBjxUYahePc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo0nKx+t3RvzSQOlnW+6vB0nwE0lp+auu9rm0IOImmVOFv67R6
	NZ3tnOej6NzE7dUd90vlcwTECx8xqCXijf5AunAp9pclqkh5Ji3I/V+ENgEyNfw=
X-Gm-Gg: ASbGncu1HhcmJRH7inYigYkjM3y7s8Zw8UDIY6Im1U1/hjNwDyC1SemccbMX2ZXi0GR
	Uqy1Q9Pv3tdluGCkW7DwKUMpi6cFrvk5ru0/XDLpZerDXOZ6OpV4RQY6nxc3Fp/wNehBHN1dKej
	7gJCW9n0ISlkGlgQezOhAsUUmV0ugHpWGdh8dr+vBqf8zUDLHaHbME5o0U0a6BL7GVCgy0WVKZL
	ptkZCvQ/okHggwrJZibkQNZq4kT7K9NJFqC/E7BpNZ49FDPs55XBXkxGPMigZrhGqJ7O7gGSa2i
	3iKjW7St+qpZOT+lxMWZRaktcwO7jU9Q6R3u6gqRbfDWl9v2
X-Google-Smtp-Source: AGHT+IF3CJoa5gLjBiJodD+/fcAKbJi9kK8EPGZgsz0yOn8C5Pq2tbjitNJRw36ftrGGInm9OE4Ezw==
X-Received: by 2002:a5d:47c5:0:b0:38f:4d20:4a17 with SMTP id ffacd0b85a97d-39c120dec24mr6778714f8f.13.1743414621425;
        Mon, 31 Mar 2025 02:50:21 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff03715sm117091365e9.31.2025.03.31.02.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:50:21 -0700 (PDT)
Message-ID: <4d8d0d479a1ff19bc3e3a8f5832d924ab822f13a.camel@linaro.org>
Subject: Re: [PATCH v2 01/32] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo
 Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette	 <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King	 <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon	 <will@kernel.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Date: Mon, 31 Mar 2025 10:50:19 +0100
In-Reply-To: <20250331-prophetic-convivial-dinosaur-efb1af@krzk-bin>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
	 <20250328-s2mpg10-v2-1-b54dee33fb6b@linaro.org>
	 <20250331-prophetic-convivial-dinosaur-efb1af@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Mon, 2025-03-31 at 09:34 +0200, Krzysztof Kozlowski wrote:
> On Fri, Mar 28, 2025 at 01:28:47PM +0000, Andr=C3=A9 Draszik wrote:
> > =C2=A0allOf:
> > +=C2=A0 - if:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
st: samsung,s2mpg10-pmic
> > +=C2=A0=C2=A0=C2=A0 then:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg: false
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samsung,s2mps11-acokb-groun=
d: false
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samsung,s2mps11-wrstbi-grou=
nd: false
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - required: [interrupts]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - required: [interrupts-ext=
ended]
>=20
> Drop, you should require only interrupts.

As mentioned in the commit message comments, it doesn't work with
just interrupts. It appears that dtschema's fixups.py doesn't
handle this case. With just interrupts, DT validation will fail
if the DT uses interrupts-extended. There was at least one other
binding that specified interrupts in the same way, so I went with
the same approach.

> OTOH, why regulators subnode is not needed? Commit msg mentions they
> exist, so they should be required. Binding does not change because you
> added or did not add yet some driver support.

I wanted to avoid DT validation errors, because we haven't started
working on regulators yet, and it might take a little while until
everything is in place.

I'll make it required in the next version.

Thanks!

Andre'


