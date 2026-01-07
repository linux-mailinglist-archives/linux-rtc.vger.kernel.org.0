Return-Path: <linux-rtc+bounces-5663-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EC1CFCF19
	for <lists+linux-rtc@lfdr.de>; Wed, 07 Jan 2026 10:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8F4E3067661
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jan 2026 09:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934FB2EAB6E;
	Wed,  7 Jan 2026 09:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PhseDA4r"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0423F2D8DA8
	for <linux-rtc@vger.kernel.org>; Wed,  7 Jan 2026 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767778591; cv=none; b=HjzLaX25JWkL2H/bnmkwHC2gBK1TJeRowe+pz7RJqJVqC7zsREpbmJEfPFRfpgNFjBcLmerX7qyqH3bJe2DQ1Mao2xKPP2kbRTycxyUSJKqan0Qz6zXHNANSI1s64q15uGuqburgqAQFZpfKq4rcEnfGPEtE4/5nsOJ83V77LLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767778591; c=relaxed/simple;
	bh=BvNOm3NYbiU+ikXbwLgo3IoCKmUPU46BKkQ49BFiqJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONQ525G9l2Qm8aImctaEYqO/N4ZeN/746rXBbbZ+YvtofL/tTwg93+psdV+0cRNO0kWi+/Qu/SlW4i9+NwW4B+5EKxv1NpoRSCNyTS6MKtahdb/mmW5Rm2fi57WS8gBpFtm8ljIb6Km/ISWa0fwmUZTDH+Jek/BnyfEJ/D5HFKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PhseDA4r; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-65d1a094185so791056eaf.1
        for <linux-rtc@vger.kernel.org>; Wed, 07 Jan 2026 01:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767778587; x=1768383387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAJ5e65k3z1Bl84v4hSYV5jHbNZ5QqotFXMyK4sLylU=;
        b=PhseDA4rqOuGczQm8OI6ScQU96wNFWhck5YtuZvI3HSw+b+MsyyRb890d3laSxoB3e
         QFMpjN6aTvp+kbwyhLQo2J9od15tVdqXeg59qbxlSb2KYBiiePlcD4da/NZp15pAKkBy
         Mk1tudHrk3NEZlkxU0REHb8ECZjHYoNl+keMpMdQ8J1+7BWavYQN1EE+0Q2ZubgyH3cb
         9q7tX7boJlgSoFQqNjwa2K7JwHtBqMT7CB+3UG+mFjwSA01TAfkwDnk4noi5e4tQfzrH
         kz3GB4HSeiNTKvHacsIsX4s+4xZ7qV5xS1hoE6TuLlj8MomLoCEBFuyuvnfIZdE9Vpkz
         rY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767778587; x=1768383387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GAJ5e65k3z1Bl84v4hSYV5jHbNZ5QqotFXMyK4sLylU=;
        b=RT9JcYbZTBu2TGMZ4zyeOUilWDPip1scn5y/XX93ZzX/GLRHkOM9vBypXPPkMhbwjH
         NIWD3klq701bJyGqVXYYyhSevX0Ln+lVJTw4TRlf6kE7SsuaHdxo+rJOO7Z+oKrkiuj1
         xR+vLv7OU7oYtOtvO9rZ6a7BTP4Jbup+CfZ1I2A/AlfvljZGhj9Q/xhgr+wbS8iIYjnW
         Kz6EowhmTPpBIWYsejU0QBxtFiaraQ/ltM2WPLLA8hnABPv+2EMeMlHo93rsuaXnng/8
         yfARZwwX7un27K3I8OrRR72UNHqedeGNPeuVUQoy5Gs7Inu/Sb38P2qbaewwZKHJgpQ4
         AuiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy7B3VPnzekLQMRCG6Ckk7HJ07jzZMANmUzhmRcb17XrcwYSw1IP9UfRpCHZ6RLhOPKvOeWaSThxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YznKNFv9o6jPgT/Iwl2+d0Pu+dbqdM7OB3b4Jt9TX1X0zZ+rftu
	6bhUtdug/HPSx6k0pTXZIgfPTsXmllCjZBFW6tOml4IV902Lm9OcHuXT9sYoFrLjzLS9sm+l55B
	uglxDU1sE5L8M0RkWtzhQ8K58u++9fYfZ3Ddafc+Vhg==
X-Gm-Gg: AY/fxX6IpqepGIO5nWcDuyp7tBqaHTzmLi1ExyqEZTVfRP9z04ZHlFCYYq0FNKGSf0o
	t1MPvY7lLRARlKYI+lcmng1mlaMl0BnTYAg2DnwefUyqaXWaXabnOTIFzVl02OpmV7uDmBbkr8c
	npE4XWSZyfbTrSvDGKZOV+ss7CUK2fPEgnF8FZmgNupF6RD/B9V9vMvU65bCdzBVFGXMc71e8p3
	lnEbnGWXIb56n+G/9KcHKoO3UypufbLzN2ebu0bXZLA6AWo9jNzWgIo9i+dR+zkHJmPofMZ2uQv
	9JvclgXvewfzpgdOXhZeSXceHw==
X-Google-Smtp-Source: AGHT+IH8mMrbtH032ZDWJFlkRThntfnwmPEqUqd2JDeL8NGsufG7LDpL42U7yHJF4QJdKPnzDUAc6fHTBjr7gAIIOLU=
X-Received: by 2002:a4a:ba13:0:b0:659:9a49:8f89 with SMTP id
 006d021491bc7-65f55085418mr579167eaf.78.1767778586821; Wed, 07 Jan 2026
 01:36:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com> <d14a9c41-9df7-438f-bb58-097644d5d93f@nvidia.com>
In-Reply-To: <d14a9c41-9df7-438f-bb58-097644d5d93f@nvidia.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 7 Jan 2026 10:36:15 +0100
X-Gm-Features: AQt7F2pWAOmWwJm8vdt2KOCYOYr18EvzYgjBZjv21zyTW_ttRjt9UA8BFElgUTo
Message-ID: <CAHUa44Hhyz_zF5JtCz00YqbgoPTLK2iS7NBT8UwOLpAz=3VZAA@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] tee: Use bus callbacks instead of driver callbacks
To: Jon Hunter <jonathanh@nvidia.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jonathan Corbet <corbet@lwn.net>, Sumit Garg <sumit.garg@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Peter Huewe <peterhuewe@gmx.de>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
	linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Tue, Jan 6, 2026 at 10:40=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> Hi Uwe,
>
> On 15/12/2025 14:16, Uwe Kleine-K=C3=B6nig wrote:
> > Hello,
> >
> > the objective of this series is to make tee driver stop using callbacks
> > in struct device_driver. These were superseded by bus methods in 2006
> > (commit 594c8281f905 ("[PATCH] Add bus_type probe, remove, shutdown
> > methods.")) but nobody cared to convert all subsystems accordingly.
> >
> > Here the tee drivers are converted. The first commit is somewhat
> > unrelated, but simplifies the conversion (and the drivers). It
> > introduces driver registration helpers that care about setting the bus
> > and owner. (The latter is missing in all drivers, so by using these
> > helpers the drivers become more correct.)
> >
> > v1 of this series is available at
> > https://lore.kernel.org/all/cover.1765472125.git.u.kleine-koenig@baylib=
re.com
> >
> > Changes since v1:
> >
> >   - rebase to v6.19-rc1 (no conflicts)
> >   - add tags received so far
> >   - fix whitespace issues pointed out by Sumit Garg
> >   - fix shutdown callback to shutdown and not remove
> >
> > As already noted in v1's cover letter, this series should go in during =
a
> > single merge window as there are runtime warnings when the series is
> > only applied partially. Sumit Garg suggested to apply the whole series
> > via Jens Wiklander's tree.
> > If this is done the dependencies in this series are honored, in case th=
e
> > plan changes: Patches #4 - #17 depend on the first two.
> >
> > Note this series is only build tested.
> >
> > Uwe Kleine-K=C3=B6nig (17):
> >    tee: Add some helpers to reduce boilerplate for tee client drivers
> >    tee: Add probe, remove and shutdown bus callbacks to tee_client_driv=
er
> >    tee: Adapt documentation to cover recent additions
> >    hwrng: optee - Make use of module_tee_client_driver()
> >    hwrng: optee - Make use of tee bus methods
> >    rtc: optee: Migrate to use tee specific driver registration function
> >    rtc: optee: Make use of tee bus methods
> >    efi: stmm: Make use of module_tee_client_driver()
> >    efi: stmm: Make use of tee bus methods
> >    firmware: arm_scmi: optee: Make use of module_tee_client_driver()
> >    firmware: arm_scmi: Make use of tee bus methods
> >    firmware: tee_bnxt: Make use of module_tee_client_driver()
> >    firmware: tee_bnxt: Make use of tee bus methods
> >    KEYS: trusted: Migrate to use tee specific driver registration
> >      function
> >    KEYS: trusted: Make use of tee bus methods
> >    tpm/tpm_ftpm_tee: Make use of tee specific driver registration
> >    tpm/tpm_ftpm_tee: Make use of tee bus methods
>
>
> On the next-20260105 I am seeing the following warnings ...
>
>   WARNING KERN Driver 'optee-rng' needs updating - please use bus_type me=
thods
>   WARNING KERN Driver 'scmi-optee' needs updating - please use bus_type m=
ethods
>   WARNING KERN Driver 'tee_bnxt_fw' needs updating - please use bus_type =
methods
>
> I bisected the first warning and this point to the following
> commit ...
>
> # first bad commit: [a707eda330b932bcf698be9460e54e2f389e24b7] tee: Add s=
ome helpers to reduce boilerplate for tee client drivers
>
> I have not bisected the others, but guess they are related
> to this series. Do you observe the same?

Yes, I see the same.

I'm sorry, I didn't realize that someone might bisect this when I took
only a few of the patches into next. I've applied all the patches in
this series now.

Thanks,
Jens

