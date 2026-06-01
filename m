Return-Path: <linux-rtc+bounces-6598-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBWrIHVJHWo2YgkAu9opvQ
	(envelope-from <linux-rtc+bounces-6598-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Jun 2026 10:57:25 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8945661BE6F
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Jun 2026 10:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3A3A30580E9
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Jun 2026 08:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F207E385D7F;
	Mon,  1 Jun 2026 08:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBcM8gp/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FA436657B
	for <linux-rtc@vger.kernel.org>; Mon,  1 Jun 2026 08:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303644; cv=pass; b=pdoxjUlxHtJuW6gxwtIrk44s7KS0z03gO5m8d1mv6KsWznr74/+nl44xGrVX3IlOyd6Yds0ipfw2KPreUi3VtYpRz0vIYsD83fi2kYO2l8W1Fg72xfDbsYbPrI+YZN0oh1NaSapPkQO8nbdey2Q9xPYr8ewHkToVqirR0fqYr6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303644; c=relaxed/simple;
	bh=Lz48MYucWeck+gFRGbDt33LqAo8mtb/f0FIeJwdCjaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jF/lU9ocXLCs7r2YK7obBuQc5aIIggkNTtu+I6R4z2RLqGUrdEXvsvBNfF49/UnS8gO0NDGzFdq18uRAh+prnq/O0rTZGzDPxCnuYHiPuJ67aKO9OUpzadGToZtYDJfIwEGdAmbi9AuUrDYtXSR2NanTvAeKhJ0JyEFZuxNwJnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBcM8gp/; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ce9d444173so13124616d6.2
        for <linux-rtc@vger.kernel.org>; Mon, 01 Jun 2026 01:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780303641; cv=none;
        d=google.com; s=arc-20240605;
        b=dNgb3SwWjIein4K1wO8eFcwf7K1lXu7XNVnUALIWJf2bRd4oGlyfXKjLez7xZRGmsA
         qcfrLrH7SHJL6Pdb23PpFyGA9uDJNFfhPzaVG4KlLeoh8tWDi5UCHX39jfyJFrDVlG2t
         pnrSAWv0QgDarZK/SJtQjomZ4INM+SnMLo07zdPCeQUuirqDrS1iSufGmROlMhARIBla
         aWhrwYnfpg5K2mqHzeCgZVgLmvZp7VI9AuNND+IdwB94coQgkdlQxwxdjVnRkIKbha43
         6iYqJAKx/Muy2vJ13DJ80GlueGtqiB9dt9RuV25UYFGW57GYGrGtwtRi67lr2HrZX2jN
         Jtyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CKxWnwT4qMFwN6R1bhhj9rNzN+v9rhOvJPe8dtaWsgM=;
        fh=EqcLGOPC1C+x8SCxy18MFnkNYvMDnOclWwHrbDq9FMk=;
        b=FwV2ieT+UENyR0f7ZB1W6ZXCToLKup+dPVgQHjMgWcGNU3c3PacbLsftxXmoEgwWlS
         KYQrBJ2n/I5s5i04CdW4vGlzGOtQezuDC9tmV0/oGDmDnknLQYVtpykzK/jpjIfc+UMi
         uUISN4yscuPv1V9acNKlgG/7f9bkfybMbsZsEoK3cKC0BL8cq7Qd0nJqRb5Ot6s8fVQn
         y5FbT/UC4whlwBi9AgCyzRUVR/JtuEEoB+I+up+EcrSxPnWEx5gKMB4JqwVOhN9GUfpU
         ubIm25hltTNGInFpaZHGyELhA3TaVJBPCRRhrfO2OOBthBhE6v8qwtHSyfb3fH/SUzIe
         jaXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303641; x=1780908441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKxWnwT4qMFwN6R1bhhj9rNzN+v9rhOvJPe8dtaWsgM=;
        b=RBcM8gp/YI4K1rCXtgV7jMztswwfmoorvKQch++/6z757+E/lovWGY0sM2pEFjdUWQ
         uM82Y+Z0fpTcqka+jdQU+r43FKXwo50YEbzo5Racg+mZh01aIyBsNFGLzsJXbEb3RCIh
         rIMB/xFcguFCSzRB7oH6E9twQQp23MY4b12oAm8kT3kOLAWJgdIP2dItaPYnn5pmc33u
         BRiaibmx+kGU2n3mHgtOBdIfvu3h6hCkdbcgqku36oyataHe/1horqP+I9V0v71t9/bc
         VNZkdl293b0rboQC1p5Yh5nEAF/gTaCYvAlE0X+NHiw3jeybBMHps+WZgdg0Tq43DAoY
         KTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303641; x=1780908441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CKxWnwT4qMFwN6R1bhhj9rNzN+v9rhOvJPe8dtaWsgM=;
        b=Dyl1uovec0WfKfO1R2Iwwz58zh2nByaLXHXPa7YNvYd/Q5hME/aQ99wNYLu6wkUYYT
         u7hx2p3Gajbp0OJUJlcYFhs/cvdAkQVPJF4bXe3J5ZXpv++K3oSsghk5x8pghXxEDmic
         8RkBYQA/eaqoctIEtdSN0WZu+aY+SfTRrLNFu4GOX0G0IQWSvsfveReZNXnjxzKn9rOL
         iUdGdzdIpnu2ulBap0385I8btvy2wMCcXKQrdYNPu6JvLyPQ2nkxLefWCJsQmhQca+FF
         WmpOeiFCyHrgwzzlAo4cAgie4FkIQ04yzxo9R8/LCbdToKKaZm52ldv4izNYoJRrZjYA
         7tQg==
X-Forwarded-Encrypted: i=1; AFNElJ/bPsZDmurAorSoEv6Y21w9cdHWPacHzfRrKmrnfuyVHGqC+M4M77zUUhDJ+otG0WDmGUhFh633B/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG+wd8flW4GDOP8WHsQbfUl5mZ7idOHKDVIOFF179hPzIXUM63
	vXJTdO5HPSmrFQ8OjwF7jeqtyWFiXfkFJnM8aDWsyNG50tNWhw90du4Tt/R5aSintrAzmX09+j5
	9PXJAguMn5jD8cEfZsshjCGP8iUdjVqc=
X-Gm-Gg: Acq92OFIrDLE3iF1sR8dXzIN1NCj+PfDz2rdFIRiGwpma3I4CDNuEJrQNmqTYt5+0De
	k6NToLDKeoUDhIqwQ4qExp7qACChru33iBtQcW29IMMRPTlXARB4hEBUQ2mGt56WFto11K6R/D1
	e9q8ZKf4PwJcAypGyot7GWJuJnAeTRCL1YeUqYFVEjbfZvANviGhK/kjd0JkNv9Yp3M9Kg1ZmU6
	Egm+szYFcq5blZ33Z2VOlV8XqIwiatrq8ipHxuEn5XjMPAepMi+cIeCFZCZh6gy+8f8e3Q/K0fO
	MXZVgAJdOmSUJOTDx9JaClF0I0hqzpcQu/f9dopRhrDXyhAdq80=
X-Received: by 2002:a05:622a:40cd:b0:50e:60d7:b272 with SMTP id
 d75a77b69052e-5173a7d90c7mr140328351cf.41.1780303641295; Mon, 01 Jun 2026
 01:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531171612.4536-1-challauday369@gmail.com>
In-Reply-To: <20260531171612.4536-1-challauday369@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 1 Jun 2026 12:47:12 +0400
X-Gm-Features: AVHnY4LqPWs8S4bKdnrdtTTPlTNYLqcvCvtLLp-8xKNVLphnJsWYHcJKSd7K0Fg
Message-ID: <CABjd4YxF52YZHkbF1C+cfXkiU4LW0PTNHyEDayKn-mvk6u42Og@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: vt8500: via,vt8500-pmc: Convert to
 DT Schema
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: krzk@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	skhan@linuxfoundation.org, me@brighamcampbell.com, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6598-lists,linux-rtc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[d8130000:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,devicetree.org:url]
X-Rspamd-Queue-Id: 8945661BE6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 31, 2026 at 9:16=E2=80=AFPM Udaya Kiran Challa
<challauday369@gmail.com> wrote:
>
> Convert the VIA/Wondermedia VT8500 Power Management controller binding
> from the legacy text format to DT schema.
>
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> Changes since v1:
> - Make child node binding constrained
> - Fix example to include the clock container node
> - Fix maintainers list
>
> Link to v1:https://lore.kernel.org/all/20260524110047.37590-1-challauday3=
69@gmail.com/
> ---
>  .../bindings/arm/vt8500/via,vt8500-pmc.txt    | 13 -----
>  .../bindings/arm/vt8500/via,vt8500-pmc.yaml   | 53 +++++++++++++++++++
>  2 files changed, 53 insertions(+), 13 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/vt8500/via,vt85=
00-pmc.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/vt8500/via,vt85=
00-pmc.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.=
txt b/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.txt
> deleted file mode 100644
> index 521b9c7de933..000000000000
> --- a/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.txt
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -VIA/Wondermedia VT8500 Power Management Controller
> ------------------------------------------------------
> -
> -Required properties:
> -- compatible : "via,vt8500-pmc"
> -- reg : Should contain 1 register ranges(address and length)
> -
> -Example:
> -
> -       pmc@d8130000 {
> -               compatible =3D "via,vt8500-pmc";
> -               reg =3D <0xd8130000 0x1000>;
> -       };
> diff --git a/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.=
yaml b/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.yaml
> new file mode 100644
> index 000000000000..e340281e5726
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/vt8500/via,vt8500-pmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: VIA/Wondermedia VT8500 Power Management Controller
> +
> +maintainers:
> +  - Alexey Charkov <alchark@gmail.com>
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +
> +description:
> +  The VIA/Wondermedia Power Management Controller provides register acce=
ss for
> +  clock and power management functions on VT8500 and WM8xxx series SoCs.
> +
> +properties:
> +  compatible:
> +    const: via,vt8500-pmc

Each SoC version had different registers within the PMC node (even
though key components such as the OS timer and reset control kept the
same offsets and function). So this really should be a SoC-versioned
enum rather than a single "compatible", as they were never really
mutually compatible (despite what current DTs say).

> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    type: object
> +    description: Container node for VT8500/WM8xxx clock provider nodes.
> +    properties:
> +      "#address-cells":
> +        const: 1
> +      "#size-cells":
> +        const: 0
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"

#address-cells and #size-cells are automatically required once the
subnodes have regs, so it seems that this whole section could become
just "clocks: true" with no particular loss of meaning.

> +    additionalProperties: true

If the PMC binding ends up separate from the clock control bindings
(which I'm somewhat skeptical of, see [1]), shouldn't the subnodes of
this clocks node be explicitly specified to follow that binding? The
fixed 25 MHz reference clock is not part of the PMC and doesn't belong
there (despite what current device trees contain), but the rest do.

[1] https://lore.kernel.org/all/CABjd4YzJoHrx1suMbhNvrMP+X=3Dd=3DthvXYwSY=
=3DUD-4Qy=3D7-qmjw@mail.gmail.com/

Best regards,
Alexey

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmc@d8130000 {
> +        compatible =3D "via,vt8500-pmc";
> +        reg =3D <0xd8130000 0x1000>;
> +
> +        clocks {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +        };
> +    };
> --
> 2.43.0

