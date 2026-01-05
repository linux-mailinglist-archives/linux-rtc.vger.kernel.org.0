Return-Path: <linux-rtc+bounces-5645-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9A5CF2ABD
	for <lists+linux-rtc@lfdr.de>; Mon, 05 Jan 2026 10:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4AC8030049D1
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Jan 2026 09:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8B131ED75;
	Mon,  5 Jan 2026 09:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aYsHIRYZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEC632C312
	for <linux-rtc@vger.kernel.org>; Mon,  5 Jan 2026 09:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767604588; cv=none; b=OEfipHDowcUW+5PnUrp+2B/5R/RAPVgi4ynZchQZqXHts6mP91vuBOGaITXOBhY9+hojoQ7XFL/5HBt0koUTBm91Fdd3J1psaeNByRzZe8ui7xJId+6Kmjl0kjGI2Iwe92yGNe3Pg4XwGx4RHhuN7tM026AqmfCUuKHmYF5myW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767604588; c=relaxed/simple;
	bh=OWC+AHxZdxUuVZM/YaeSNjU/c5cKFkHpncudd9Oa0yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FuR03or/OjsVCX3oRUnyG9tlYtOUg7cAyqyjI5a/VxxPb3OXV4qyflrfFb7WpBMBWwAZeLQbS9JtIs1WmwbrT0mft3cH5aM5LDfEpGzOoZ+1SGYhEZ/3fEO6daoLAlahK04yjprItb4ga5toZFwh3d7q2W4DArh162WC2VNXYpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aYsHIRYZ; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-65749fe614bso3741947eaf.1
        for <linux-rtc@vger.kernel.org>; Mon, 05 Jan 2026 01:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767604581; x=1768209381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xS4Pieemzy4r1o+XZyR7jxfKf1/JCiqumXmtg6ZAf0Y=;
        b=aYsHIRYZmEqubVaB/nFOB2ZSyZ5mdUAJQ2e8vK7U6xa1ASeFd6LWH955d9+nh53ktb
         xr1P49S3syRT14RFGDCfbl+SIJj8H1shK6l/HJyqERcZfy8YT9XcW9ovCyPlV1JPbept
         stVuPPdDv4O0rskrIVR6VeYaEnAM5RPbtavEumXMM3wqDI/5YZbPJj/fIsEwMgjbttlW
         vq78fx3LM7I7y53tg3lpxh5jqIHVy7So3PmCqVqS6shGFcQdOC2kuMGEH3Kt5Owzm2Qm
         rjvtr+TvOeiiwnoqs3PniCzuVCCjBVzPM3FD6VXVz+bPcHzpEmbFp1Ii0V1COQygdl4e
         lteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767604581; x=1768209381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xS4Pieemzy4r1o+XZyR7jxfKf1/JCiqumXmtg6ZAf0Y=;
        b=mK2AA26JJ7yw6bACSU7EIf767WWYP7b8WeD4IgDuQXiw6yhJ0TOa4bN8WvAZZGTUbT
         TBI4UkCSlkJF3ELwzCxDB791mkmg6obJPYHw0GUCuuFhgUQKYm8HjZ07xXuoiRdjPBLk
         hlNZhqVx2MtVzRbdSRqEc9bUgtNaaNmrK2epLq1ceCZByMgjGCI5MZ7Dxl6aTNDEPX9E
         NCC0Aa7Nk1R0ZwOrCyUBZqK5eFTA+aeBWYlmfqTutyioHc+uiDjwH3peK5fZji7RLjA4
         yMZyTNQZGAxeMLIPFZVCGrRTZleKhlv2dCXPD8/g3G/dSjMGWS7AcidInSFEi6ERYQ0q
         V18w==
X-Forwarded-Encrypted: i=1; AJvYcCXJEN3I2DNu285YB5R5W9k4y4V2FIoatzxg08YUtfAonyMIcxV8TzLTWTfWaxwnE7xWxB1t897Ez0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjp3vLZBb4kqitw6/c199I5kHS/Q3lTObtA6ERhG9m/B2fXLXb
	/SQAwG8xrhYfaIMIKbNt+bDz3HFRAwB2RBy8NdmutO1aq/AEbhz0tZ6gWMfJiXhpHyCyLNwCq/s
	VaS45zwh3OuzjTtdwOWam37K+zP0w3gB0xNsbyf0Qeg==
X-Gm-Gg: AY/fxX7hlz6PpMLHJtzMEWmq/8zEVdAOsHM/1a2ZQFVpI0dzwwX6wDLosWADvU5jEcp
	AMiHBx1JdIe/sRL26lG7H3CjAZUmWW2JrY0BTpUYQSBa2gib29aG/Tl6foKzsDohUqxEydkd8E4
	BmWgb2ftsMJmXTMYHq3WkN9oqIGG3etSdQGOPbEphp3HsWfzGbEK+XoVAe9nhiY9IL5wIX6fNTl
	CkDEHhcU3WaqrHTxT3Rw0kgywt4yz3QawY7skYvH4BWyp1MX/1enmrQY3UJYAqeDTiTGRCEhPPN
	JshyyIMY7QueG0EVa1cvm5sXCg==
X-Google-Smtp-Source: AGHT+IHdtu3uK1YvLPvRXmBmsYletnr+Fy6yEnWw7FcQJMBZUAFsUyE2L/0PG3GpU/2KGeBY95bkFD0S8glmAzrpFaU=
X-Received: by 2002:a05:6820:2289:b0:65c:f9c1:cba0 with SMTP id
 006d021491bc7-65d0ea16a88mr23376881eaf.37.1767604581140; Mon, 05 Jan 2026
 01:16:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
 <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
 <20251218135332f323fa91@mail.local> <CAHUa44GpW5aO26GDyL9RZub9vVYvVcJ7etwO0yXBN_mUi0W4AA@mail.gmail.com>
In-Reply-To: <CAHUa44GpW5aO26GDyL9RZub9vVYvVcJ7etwO0yXBN_mUi0W4AA@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 Jan 2026 10:16:09 +0100
X-Gm-Features: AQt7F2q8lTcIoa5xBnvz2Mkjx2axWX5OMGPJpQNfFM5WoFI2KGlEdVoT6sJvPQg
Message-ID: <CAHUa44HqRbCJTXsrTCm0G5iwtkQtq+Si=yOspCjpAn-N2uVSVg@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] tee: Use bus callbacks instead of driver callbacks
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jonathan Corbet <corbet@lwn.net>, Sumit Garg <sumit.garg@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
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
	linux-security-module@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 18, 2025 at 5:29=E2=80=AFPM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> On Thu, Dec 18, 2025 at 2:53=E2=80=AFPM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 18/12/2025 08:21:27+0100, Jens Wiklander wrote:
> > > Hi,
> > >
> > > On Mon, Dec 15, 2025 at 3:17=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > > <u.kleine-koenig@baylibre.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > the objective of this series is to make tee driver stop using callb=
acks
> > > > in struct device_driver. These were superseded by bus methods in 20=
06
> > > > (commit 594c8281f905 ("[PATCH] Add bus_type probe, remove, shutdown
> > > > methods.")) but nobody cared to convert all subsystems accordingly.
> > > >
> > > > Here the tee drivers are converted. The first commit is somewhat
> > > > unrelated, but simplifies the conversion (and the drivers). It
> > > > introduces driver registration helpers that care about setting the =
bus
> > > > and owner. (The latter is missing in all drivers, so by using these
> > > > helpers the drivers become more correct.)
> > > >
> > > > v1 of this series is available at
> > > > https://lore.kernel.org/all/cover.1765472125.git.u.kleine-koenig@ba=
ylibre.com
> > > >
> > > > Changes since v1:
> > > >
> > > >  - rebase to v6.19-rc1 (no conflicts)
> > > >  - add tags received so far
> > > >  - fix whitespace issues pointed out by Sumit Garg
> > > >  - fix shutdown callback to shutdown and not remove
> > > >
> > > > As already noted in v1's cover letter, this series should go in dur=
ing a
> > > > single merge window as there are runtime warnings when the series i=
s
> > > > only applied partially. Sumit Garg suggested to apply the whole ser=
ies
> > > > via Jens Wiklander's tree.
> > > > If this is done the dependencies in this series are honored, in cas=
e the
> > > > plan changes: Patches #4 - #17 depend on the first two.
> > > >
> > > > Note this series is only build tested.
> > > >
> > > > Uwe Kleine-K=C3=B6nig (17):
> > > >   tee: Add some helpers to reduce boilerplate for tee client driver=
s
> > > >   tee: Add probe, remove and shutdown bus callbacks to tee_client_d=
river
> > > >   tee: Adapt documentation to cover recent additions
> > > >   hwrng: optee - Make use of module_tee_client_driver()
> > > >   hwrng: optee - Make use of tee bus methods
> > > >   rtc: optee: Migrate to use tee specific driver registration funct=
ion
> > > >   rtc: optee: Make use of tee bus methods
> > > >   efi: stmm: Make use of module_tee_client_driver()
> > > >   efi: stmm: Make use of tee bus methods
> > > >   firmware: arm_scmi: optee: Make use of module_tee_client_driver()
> > > >   firmware: arm_scmi: Make use of tee bus methods
> > > >   firmware: tee_bnxt: Make use of module_tee_client_driver()
> > > >   firmware: tee_bnxt: Make use of tee bus methods
> > > >   KEYS: trusted: Migrate to use tee specific driver registration
> > > >     function
> > > >   KEYS: trusted: Make use of tee bus methods
> > > >   tpm/tpm_ftpm_tee: Make use of tee specific driver registration
> > > >   tpm/tpm_ftpm_tee: Make use of tee bus methods
> > > >
> > > >  Documentation/driver-api/tee.rst             | 18 +----
> > > >  drivers/char/hw_random/optee-rng.c           | 26 ++----
> > > >  drivers/char/tpm/tpm_ftpm_tee.c              | 31 +++++---
> > > >  drivers/firmware/arm_scmi/transports/optee.c | 32 +++-----
> > > >  drivers/firmware/broadcom/tee_bnxt_fw.c      | 30 ++-----
> > > >  drivers/firmware/efi/stmm/tee_stmm_efi.c     | 25 ++----
> > > >  drivers/rtc/rtc-optee.c                      | 27 ++-----
> > > >  drivers/tee/tee_core.c                       | 84 ++++++++++++++++=
++++
> > > >  include/linux/tee_drv.h                      | 12 +++
> > > >  security/keys/trusted-keys/trusted_tee.c     | 17 ++--
> > > >  10 files changed, 164 insertions(+), 138 deletions(-)
> > > >
> > > > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > > > --
> > > > 2.47.3
> > > >
> > >
> > > Thank you for the nice cleanup, Uwe.
> > >
> > > I've applied patch 1-3 to the branch tee_bus_callback_for_6.20 in my
> > > tree at https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-=
tee.git/
> > >
> > > The branch is based on v6.19-rc1, and I'll try to keep it stable for
> > > others to depend on, if needed. Let's see if we can agree on taking
> > > the remaining patches via that branch.
> >
> > 6 and 7 can go through your branch.
>
> Good, I've added them to my branch now.

This entire patch set should go in during a single merge window. I
will not send any pull request until I'm sure all patches will be
merged.

So far (if I'm not mistaken), only the patches I've already added to
next have appeared next. I can take the rest of the patches, too, but
I need OK for the following:

Jarkko, you seem happy with the following patches
- KEYS: trusted: Migrate to use tee specific driver registration function
- KEYS: trusted: Make use of tee bus methods
- tpm/tpm_ftpm_tee: Make use of tee specific driver registration
- tpm/tpm_ftpm_tee: Make use of tee bus methods
OK if I take them via my tree, or would you rather take them yourself?

Herbert, you seem happy with the following patches
- hwrng: optee - Make use of module_tee_client_driver()
- hwrng: optee - Make use of tee bus methods
OK if I take them via my tree, or would you rather take them yourself?

Sudeep, you seem happy with the following patches
- firmware: arm_scmi: optee: Make use of module_tee_client_driver()
- firmware: arm_scmi: Make use of tee bus methods
OK if I take them via my tree, or would you rather take them yourself?

Michael, Pavan, are you OK with the following patches
- firmware: tee_bnxt: Make use of module_tee_client_driver()
- firmware: tee_bnxt: Make use of tee bus methods
OK if I take them via my tree, or would you rather take them yourself?

Thanks,
Jens

