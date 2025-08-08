Return-Path: <linux-rtc+bounces-4648-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8881BB1E0B7
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Aug 2025 04:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81E17188782F
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Aug 2025 02:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5859D1684AC;
	Fri,  8 Aug 2025 02:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcQ7JfKS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8AA2EAE5;
	Fri,  8 Aug 2025 02:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754621420; cv=none; b=hmRdzEMIhwbWzndEs9E7jBB96aCxkKGPXH1nrP3SyOQ5/ndpVedR7bgJjfFVvT5vkDQqImA3bJxzbaEWya09it5m40LNJg/yh7RVR4LRHw+HlVs70JOfF/BfVsTOT+PCNiy0RcZBNG79NBklF7pddyf3GYwKyVJzlQibsIlwudI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754621420; c=relaxed/simple;
	bh=g0uv6fnhovJWLtZMN+CHOLUK990XKiCOaLMwHfLXhDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fxPne+famrlsJsiMFSjycIU9lFQvjihX2H7Q+Kgk0mAG5wMWFuhZcURxRvP6R+hG8jaHqP7MVN1Fz3l77HMkReWwwTfIglfkh4etuBRHAg8alArFy5JqFDKJ+h7iKqPNUUW2A1QApEcYMA3zSikHYJBZEtYqJ7tCB8wyjG+0Mog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcQ7JfKS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E82C4CEF4;
	Fri,  8 Aug 2025 02:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754621419;
	bh=g0uv6fnhovJWLtZMN+CHOLUK990XKiCOaLMwHfLXhDE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JcQ7JfKS4mQn8euZQhnZ62PS7UA61LBBotd01jfmfBScjSFqvxJ+QXTC6Ofb4Xo6g
	 itaGRmaHzmFKNGnahUsuoHPWLN9xaS42zDT/iErmPW6KmfN8PjCAiux9maLDBJyua1
	 CQ6enIW2kh3RZM1YDBNQtSCyG3U0TdvPu9HRA+VjN1JaCLmnrtV6qfjtJMw5+upY8e
	 j5vDS25Avm0LustWQtCcgnA1vxBwiQ2DK/esZc4en3rBf92dH7UBpVWlBEWbH8THn2
	 tefdbBf8Y7J9ZnWDbtpquDAm46SiiIv3pV1/yLMh2OVwrwfvhxs7HrV+Dne2z4syJD
	 yMJ72WEFHLHlA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so2693761a12.1;
        Thu, 07 Aug 2025 19:50:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWaMuj5HaJOjtaveTUbtQHff/soqk5+eZDhRlAOWktS4/E4WkKY2Dum0tJTR92Moh0hY4fDlhc/zUWP@vger.kernel.org, AJvYcCWmA3Gx5asYfzBk25XgZYsV1+ZN2SoL742sbj9dqTkHAJa5lKa2j8uH2BgJ+E7JzOE0YwEpBrVnOSGnC4lQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwUE4MqUqsdIkIGYtIIURsImdhBwOZYeim5zNGsHr5g07p3yJ/X
	Diz5DrZWedINSgzSiojG33RP+ebyDDCtNe19FZvFw7qltDT0PWwo880f4G4SHOf/yrOhDEyWhuj
	vhS1hbCJEQ15ZELz4895oSBfhPWKsXg==
X-Google-Smtp-Source: AGHT+IEqhXN9gcpvtww/uIXk1g5Jh4VOsYFk+Wmv8cdDGRkjJ5D8DWPxNlHmkDOdq49Uzgu3cSqj67A87cs4uT56pXk=
X-Received: by 2002:a17:906:4fc9:b0:af9:79a5:d635 with SMTP id
 a640c23a62f3a-af9c6516dd2mr95998666b.37.1754621418361; Thu, 07 Aug 2025
 19:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807214406.4172668-1-robh@kernel.org>
In-Reply-To: <20250807214406.4172668-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 7 Aug 2025 21:50:06 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+vWZhXzfhKSBwmZg+7VggFQtTp2Ssrh5MCrPSBPxbvdQ@mail.gmail.com>
X-Gm-Features: Ac12FXz_-dmuAPKBHiCgcNMqwLfNX1wH1zFmlS54hiXJ_kacMB-v_mB7IJruyMY
Message-ID: <CAL_Jsq+vWZhXzfhKSBwmZg+7VggFQtTp2Ssrh5MCrPSBPxbvdQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer/rtc: Remove duplicate st,stih407-lpc bindings
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 7, 2025 at 4:44=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> The "st,stih407-lpc" binding is documented in 3 places as it can
> function as a timer, watchdog, or RTC. As there's already a schema for
> it in watchdogy/st,stih407-lpc.yaml, remove the other text bindings.

I'm confused... The schema is only sitting in my tree, so I'll resend
with the conversion...


Rob

