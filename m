Return-Path: <linux-rtc+bounces-6190-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAp4ACzqsmljQwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6190-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2026 17:30:36 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1FF2759A4
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2026 17:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D2E03028373
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2026 16:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C2F3F87E7;
	Thu, 12 Mar 2026 16:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPxyPH1U"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DEF3F7E97
	for <linux-rtc@vger.kernel.org>; Thu, 12 Mar 2026 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773332837; cv=pass; b=btgOkAlXu7heNk0tKpxZw2ypGvav0NLc0BCDc8SLGLuPLHt4ikteFws1UVUnLzGZmRNIpSY6AOLWdX9dkUzvZvdtoN2oLTnE0sRpdFli2D7Jsqr4B/Wr16AtfnLg1M4IxyjSd3ZyPVe9tXyPNkrkGSab/wW+CuRXJ3Nmxbw4rho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773332837; c=relaxed/simple;
	bh=uJhH0lI1sVgit2CkGLU8u1v8dwsbJYGM2kBA3mKuxJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhuZoQlqekcCCv93f5/JUIgKdtR22jVoaLnVcQQj8IJfyDwreIwBg7Lcesv8X9qGXHorc+AidxI+iV2WUYHli5lRN2Hkas/IiwmBWEmjTPIENJSGsnagh8w/WwMom1DVUIwL/MX2f5hng9ca3gGFyhSvlaJXD34y1Hu0cHPskQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPxyPH1U; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b78b638eso1368127f8f.2
        for <linux-rtc@vger.kernel.org>; Thu, 12 Mar 2026 09:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773332830; cv=none;
        d=google.com; s=arc-20240605;
        b=VuPrI594a8WJ/D4+Hxo7WDmEQisNDG8nFN6S2SHyPpAVqPMtwqae8E/lSvXM9v8hxy
         nE2b+J7UdrK2sJoo1wtxMV37jV36gKETIXNIjkI+xsFHTMs0CyPp5uUUhwSbFFI3Mn95
         LAxKTfCbwAKDKVNXh6YIqIyhNe9jlrnqc3aTvECejGkDy66eQauuk7yOiu5rvMC/uwdu
         XelcjEANUfR4CYfeJ3FdKy89tSqbjrAAmpAEq0R1hBbbpiw7xKmGwWT4Ebuxta77zzsw
         FBCflXhGzxStYBFPlGYbClZIv/8Nw9VQf17bmhwyqDXA3UJyz8BV5QEAJPC1Bj0xhnDt
         adrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I7Vb1PKX3Lf9CJi8XSxHNY/kA1vBSZWZueHJy5RvI9M=;
        fh=LCEpnMZtmAi3yTeWvbCrv4BwdiHWMjUrtZJ9sOQs7kw=;
        b=IqbTXEIjdrbfLmjpnFH1PruI5cGt8c698nYpxz/IiZ/8nF/ukyVYioqxXihAuoAcRK
         mmiMnMGn2rA5wznKuK3VdCAWibkwCawoOu3guldTGOlywJDbCEswts8hQeaJwL4peJYi
         QpkvqZD1DVXkkTd+6tgfmprJS30rnZmv/7CMIfakyuOJNye+Wo12uA8aA1KPoXsdGl9W
         i739X/pRxEx9VCqOcGu0VXu+1KWMpuyatUWpEPU9FUvpjXNZ7WPDsHNQOh2an70k8FQC
         EuFi0YrpQ8PBkH64HEMIzmVr0GxGt33bCaMrHiFRcAtjY20Owl5eeD0xFEHBZZgGavq1
         feSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773332830; x=1773937630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7Vb1PKX3Lf9CJi8XSxHNY/kA1vBSZWZueHJy5RvI9M=;
        b=NPxyPH1UQiE56iO1J+Krg8QUq3kWeZN7ewAXlAKDSXLmD9rc8hiJXV6zw0tU7/4eTb
         7K2JV4eNu1HVViAEQvcpPHamtWMW9R/RN8dUfZRT/xFaWFh9ziB0R5y2vk9d81IG3Wql
         edW3lf6vaRoQETYACb7EsiIPOLgLy+DXqMWa/ba0Ly/gq0fFrd4Fe251t/u+qF2R0qAx
         WlxFEbxFqV3HI7hNcrpjKS/KmbHQAInOSmxq7YsBwBCt9UwCRd33E91N2vZYjjCu+I2n
         vM/xSlfa1htcXHU0nvfP4y6p4mEtMIFjElfxdykA5Ty1zJkkklrZKn+EyInyIw2oLdX5
         IGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773332830; x=1773937630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I7Vb1PKX3Lf9CJi8XSxHNY/kA1vBSZWZueHJy5RvI9M=;
        b=rMzsQ9L9azjH3V0QkbkPgOY+v6BLeJDFnQvGvUiH+AbCMZNom/Lg+tUqEWRnjGHctj
         gkMiaUWOmVuO14AmvGsEzueGTKPwvf3JT4jRcNxyT9gx24k01Og3AzVlIRV//zC4eb8A
         l8tC66aXoCtWUuOfV0FRQ1+iZIa3H9rNraYa4EfhrruHBC8IMfRMJ3qxf1LGdbVjKWqy
         +9UAAn/0XhFGUrT5bkPty3OXrpu+sDvC9OsoZcgqOPL+bPwJWuOU56qCARNb4MInEQAz
         jp3wxnMObMU+BfZuOFKWf3o+VMqfufji+SvsxsH1FDaJORTADVVnO2z5Cd/G41/MYSpG
         ReTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9NmrnlBufZVaI7dWMwET+iqfTpqLkQPeC061HyLgsFRgyU0P8Q4KRWVmu29pQZuOmOetIWjPb7ZY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj/ViqWg7rz3SR/GsYWjWUa/P1FKpxtAUxEItN5f0LhdUG0py7
	ctlxJ3/T7/62mZF+msRWI2Ydw/VCA0gpu2TuVpUUXmJOxEVobAVCd5/guoAXvHMVyOigbo0pG8I
	owndcPyhw8FJvVJBdQdG8U6Y877HTHRo=
X-Gm-Gg: ATEYQzzVhIQW1lG9BKb1LI5aLh9haZLPlrmkxOfyhgjQ+Lt7lM38E1VGiI//U2AXxvp
	6JKR6ufhRyHucxGe5RkzDqUI1t2AnhuifvqhZqI2kjl3jmuUMFioMfXa33UPmbAjWXbmNPOpPp3
	cWXzQH+W96361VOqUF1vMw9uOfkA4IB6nV7Uz+Q6coGpST2fJfX47IjUbzwUM71oJsDsSll4xDX
	Gk1BDGDoOzk2osQWQz9IUU7qNi4bpBDTcyHVMg1dm4euQ9/QTudRTXPXSLd4/yna/btCY7M/QeF
	faMVnPfp
X-Received: by 2002:a5d:5f88:0:b0:439:b671:1d8f with SMTP id
 ffacd0b85a97d-43a04dc0ba5mr539681f8f.45.1773332829453; Thu, 12 Mar 2026
 09:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312085258.11431-1-clamor95@gmail.com> <20260312085258.11431-3-clamor95@gmail.com>
 <20260312152057.GA3156966-robh@kernel.org> <CAPVz0n2GFgsrqo4_MkvNwd9t=DMU4ZGQzrpNjU+PZ4_Ysx_jcg@mail.gmail.com>
 <CAL_JsqKP-uYZf3MLFd5JrrsZ1+pxj-y+te_3uiM9N+5Xu4phUQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKP-uYZf3MLFd5JrrsZ1+pxj-y+te_3uiM9N+5Xu4phUQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 12 Mar 2026 18:26:57 +0200
X-Gm-Features: AaiRm51Esg3lleAiftngJqOtXTsbfFUPZvmyUsPO32KC3v38pJrGNn7u4Fa_N7g
Message-ID: <CAPVz0n0aTEkmb6tFn72f7O=BvJzvkJ6ri+_TmQbnroNrWQppzQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: pinctrl: pinctrl-max77620: convert to
 DT schema
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6190-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	SURBL_MULTI_FAIL(0.00)[devicetree.org:query timed out]
X-Rspamd-Queue-Id: AB1FF2759A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D1=87=D1=82, 12 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 17:39 Rob =
Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Mar 12, 2026 at 10:34=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail=
.com> wrote:
> >
> > =D1=87=D1=82, 12 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 17:20 =
Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Mar 12, 2026 at 10:52:55AM +0200, Svyatoslav Ryhel wrote:
> > > > Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC =
from
> > > > TXT to YAML format. This patch does not change any functionality; t=
he
> > > > bindings remain the same.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../pinctrl/maxim,max77620-pinctrl.yaml       |  97 +++++++++++++
> > > >  .../bindings/pinctrl/pinctrl-max77620.txt     | 127 --------------=
----
> > > >  2 files changed, 97 insertions(+), 127 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/maxim=
,max77620-pinctrl.yaml
> > > >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinct=
rl-max77620.txt
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/maxim,max776=
20-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-=
pinctrl.yaml
> > > > new file mode 100644
> > > > index 000000000000..4e5f997317ca
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinc=
trl.yaml
> > > > @@ -0,0 +1,97 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/pinctrl/maxim,max77620-pinctrl.=
yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Pinmux controller function for Maxim MAX77620 Power managem=
ent IC
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +description:
> > > > +  Device has 8 GPIO pins which can be configured as GPIO as well a=
s the
> > > > +  special IO functions.
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/pinctrl/pincfg-node.yaml
> > > > +  - $ref: /schemas/pinctrl/pinmux-node.yaml
> > >
> > > Don't these properties apply to the child nodes?
> > >
> >
> > They do, but not all properties defined in those schema files are
> > applicable for this binding. I have marked those which can be applied
> > in the node patterns.
>
> Then additionalProperties is appropriate.
>
> > > > +
> > > > +patternProperties:
> > > > +  "^(pin|gpio).":
> > > > +    type: object
> > >
> > >        additionalProperties: false
> >
> > I will move additionalProperties here then.
>
> No, moving it is wrong. You need it here AND in the parent node.
>

Oh, yes, you are right, it seems that I did not notice while
converting from txt. Thanks!

> Rob

