Return-Path: <linux-rtc+bounces-6593-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIEdArRmHGp0NgkAu9opvQ
	(envelope-from <linux-rtc+bounces-6593-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 31 May 2026 18:49:56 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB526172D3
	for <lists+linux-rtc@lfdr.de>; Sun, 31 May 2026 18:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FB6430015B5
	for <lists+linux-rtc@lfdr.de>; Sun, 31 May 2026 16:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1E22E266C;
	Sun, 31 May 2026 16:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pG3qjnke"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059A7242D70
	for <linux-rtc@vger.kernel.org>; Sun, 31 May 2026 16:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780246188; cv=pass; b=FesraQhHgzs6Ks9osPh86mDNwAxk9EMGEXdAt9R6KvrTqCXgIASHWwV/f9W2aUarY2GMXpilM4E2pR2+YyZn5RN9RlBQmobcDZZucTGxY1KYlJ211BVoWIS1OWKsXt2T1JKVUqrqn2D/WZS0Tuef6hRx07tK/fTnRMP1sSAjsCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780246188; c=relaxed/simple;
	bh=zryTzG5iMk2H82QgYnJw424xfPn+paahJo2LEFSERZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F7rxQzkDJ5Hd9pLuWNPs2CcISOVk0IMpA37cabXjopi52SJeGr4D8OiDosj4ebQxvTCvNCtfPkcfUgTpGUXMXV+PHKoDOv4jP9bRGVv4V8euFExeJtbBQoak6AB3M+Z+5bhkVFkDrojYUo5XrjOHAAKfKomJkFB1Ukph4ZIYzPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pG3qjnke; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-660323f7b27so3916221d50.3
        for <linux-rtc@vger.kernel.org>; Sun, 31 May 2026 09:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780246186; cv=none;
        d=google.com; s=arc-20240605;
        b=aSg9bVcW4E0aJ6TrfBGTCLnYM8BucGpGeua9ww1zIyCrQbH+ijRU2cs6KNXFYklKMW
         JiB/GVSWFTPYP5dNf6Um2n44jrH3Kk1F04l/Y3Dz5aaPo5O2zELLYWKgWar/7cJ+jDId
         tFOmBv6Um3eBXlV9VRrzeNWb6z6Oxo3yytEY3rRw+PozHyw/FiqxYmmvHkmxvepZg30z
         XLjlkzai0RIag2960Uwefryk9ACjz1Og3WSfnEVMrBFdyWWWoryA/pDY8n2IcPA3U+Di
         dLkAP+psxr/oa8k6Hik/LfbkyJu+2t81zz/X0hK3MSPOCD3eEkYhZBXaL0DbqG0+ddu/
         SSIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3vvVnqsmhKyobaDGiJTopk2ghuyT9Gj6GdwlKhFFPf4=;
        fh=SyFL5aF2kFxWYF4zmuZc10GEVaE95D8YiEuCM3zd0OY=;
        b=L0juQeI03jeJvadjtohVF/3m3TLWyvUhe/LkvYCaVT/O7f+giQy9tGI5L3cqmr3nHF
         8sDchp1lBN+JJJ+J5Qgp1bxz4zCuuWaxgUNpos4Xd3afYa8LQQD8Pt0mQM9gMwcFwkR0
         Wnr3Wmxv/m28BwrRn3D5mI/mwwe6zcixlLPr5ES8hyCBiV2Ws7NMDdfKhX+Lus8URq/K
         KU7+x/Ziqr+Mvctls3Av784xZOHXmuAymGd1w4Szo1x59EGvZCo8kCOey/WZSmfdFPys
         lHXAP9LmOrotDlqPmiWyZjvtOxk/tqJIq5HiPWLX9fR9ksinPcThqW3y9oO9on25j5wc
         xMvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246186; x=1780850986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vvVnqsmhKyobaDGiJTopk2ghuyT9Gj6GdwlKhFFPf4=;
        b=pG3qjnkeKtri2oU1iERdmsNx/YDIBxcm+twg/WvtZNFkQS9HDpIChonqUgDcmfu5LS
         tu3z6mNmMgiiDgLOdQUit8KtuhfpUN4tyC5zNTRPJW9O5tQlgfyhdO6TU1jEYJrIK0wW
         qzczqPoKgfUSaLLZlEgfK8C8/GKdDeCgVq484EjDzNREJJ38M4kzphvvhb0lQoH9kMx9
         oCflY+B9ONf7vSQ6br1yKMIE429fcDWGog5tWkna5yVBHNw3nbFpGeN7KUGlSAmyjKgJ
         nBxKjgaz55kW/lYrctjV64dzH/4C+ph3cKfFWlxrSN6JpgXIfupxkUtQ7MXWMCURrEp2
         jnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246186; x=1780850986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3vvVnqsmhKyobaDGiJTopk2ghuyT9Gj6GdwlKhFFPf4=;
        b=d9g7jXePsjxSi2dTwB1qlZReOMr0+KEOL7z/TI26/XZ9NkzHXGUYNRkqIUqrWx2f+9
         O1mezY43KIquwKB2kKSPGmpyoFzzBOrIBGU4rr26UMKMJUXi3gKfwLLCQFaON2iVLtHO
         3aP/MzqRqGG2QLyi/jyo3T+ATvdJaFbzzVZkoYc/88DturfSVyEM9vxAyJl9rUIe4m1v
         RTcdPwNKWMih4G4p6QW0cM/4fvuGQOrT7gBu+kwE/Eu2y9CZtnwdIUvGKSoZE8+BPgXO
         7dsglXTwvFceUgtfpRyWtmo+I4IY6yJ/LtMLAtT2tp9KcO4RGpvwRAYbazNlfg0d2dFV
         9vGw==
X-Forwarded-Encrypted: i=1; AFNElJ9Q93hzQYXhOxgv2ycTVjw+X77b/QCvuh1ldnjeP5eUcRSyjyQ0EZLY/u7My14YcWenAf/lYuYlYBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiRXfbF9WP+/evRSAwfymZicmrTcoVJYDZWywKgHQwCpFav2OM
	WbG9lEIb3BPb4POPLiTL75JUkRkpS5VWQceS/dgwlS0L16KNMhFGbnmSUtbDv6Vu5YY99JSjhR+
	7cecZgRy2fwphiyoFh6PrKw8fyEzn4Kk=
X-Gm-Gg: Acq92OHCaXdjP6qHvUPqQ2Y8IjPpknP2KyYGNGaAFX0RJLRFxWnV3Pi/0S3oCJJui84
	HNj2P9+xMAt0ZPadVEebfO510Rkr5OrpxNLdJ/7mfymiRkzQPREPvwtb3h13IeTpjDwjQDj9+Xm
	KVIwKlkp6ncep+2TVs2QOKw+JgULdK2/+0c8ZC4VzdWms9s7wxqw25kp9AuZsDy8CEoELcXQaqA
	8EWIKxKIU/Qtm2z6SukUuGyDcPseHl7Rcor6zsxylZnnXXsotmIU/WjpuFcEexKYg89krUW1w/p
	K7ouFfLgl5NTYJPvqw==
X-Received: by 2002:a05:690e:13ca:b0:660:5c38:8f3b with SMTP id
 956f58d0204a3-6605f71a3b6mr5723987d50.53.1780246185998; Sun, 31 May 2026
 09:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524151110.21277-1-challauday369@gmail.com> <20260530-academic-aspiring-sawfly-7dcfab@quoll>
In-Reply-To: <20260530-academic-aspiring-sawfly-7dcfab@quoll>
From: Uday Kiran <challauday369@gmail.com>
Date: Sun, 31 May 2026 22:19:34 +0530
X-Gm-Features: AVHnY4LxpC2x0GiINlS7vOZo1_ti4_hwMiVaPwxDTitDyXiuaRJqEY0xfeuMxek
Message-ID: <CAAj-GBmNXvTNbnQ8hOzsjnQd0Oi4a17LY8yjb8HTbD4PpTXH3Q@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: clock: via,vt8500: Convert to DT Schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6593-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: 0CB526172D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/via,vt8500-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: VIA/Wondermedia VT8500 Clock Controller
>
> How PMC is a clock controller? Really?

No Krzysztof, actually that was a wrong direction in v4.

> > +
> > +maintainers:
> > +  - Michael Turquette <mturquette@baylibre.com>
> > +  - Stephen Boyd <sboyd@kernel.org>
>
>
> Subsystem maintainers do not care about PMC. This can be platform
> maintainer.

I agree with you. I changed maintainers accordingly.

> > +
> > +description:
> > +  Clock controller bindings for VIA/Wondermedia VT8500 and Wondermedia=
 WM8xxx
> > +  series SoCs.
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      const: via,vt8500-pmc
> > +
> > +  required:
> > +    - compatible
>
> Why do you have select?
>
> I don't understand your changes. This was not at v2 and I did not ask to
> change that.

The select: block with via,vt8500-pmc and the clocks: type: object were
mistakenly added to via,vt8500-clock.yaml in v4 =E2=80=94 leftover confusio=
n from
trying to handle the PMC node's clock container in the same schema. In v5 t=
hese
are removed from the clock schema entirely. The PMC binding is now a separa=
te
patch (via,vt8500-pmc.yaml) which is the right place for the clock containe=
r
node description.

> > +
> > +properties:
> > +  compatible:
> > +    const: via,vt8500-pmc
>
>
> So via,vt8500-clock.yaml or pmc? Why aren't you removing the pmc file?
> Why is this located at clocks?

In the next revision, this patch is scope only to the clock provider bindin=
gs
(via,vt8500-device-clock, via,vt8500-pll-clock, wm,*-pll-clock). It no long=
er
models PMC/top-level node properties and does not modify PMC binding files.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    type: object
> > +    additionalProperties: true
>
> No, this cannot be "true".

Agreed, I dropped that structure and kept strict schema validation.

I also fixed remaining related points from review/bot feedback:
- example validation issues
- dependency constraints (enable-reg/enable-bit, divisor-mask/divisor-reg)
- explicit reg: false for via,vt8500-device-clock

Regards,
Udaya Kiran Challa

