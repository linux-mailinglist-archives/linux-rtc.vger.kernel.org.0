Return-Path: <linux-rtc+bounces-6597-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LLPDxhEHWpbXwkAu9opvQ
	(envelope-from <linux-rtc+bounces-6597-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Jun 2026 10:34:32 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A649561B890
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Jun 2026 10:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F2FC306B75D
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Jun 2026 08:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A328A33AD8C;
	Mon,  1 Jun 2026 08:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sro2ciyp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8FB331A77
	for <linux-rtc@vger.kernel.org>; Mon,  1 Jun 2026 08:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302627; cv=pass; b=TGiO8KtOVu1OTtuaBmPlJPuSJ46YPBngcuATceLp33QUE7IfxOnR8prVkTOjn5eswNpxwLE4Ias0hqbbj6x+WasiJ+mp4zbOz8fSY/rM/fS4114uqhSifTNAg2w0woY/AIzk9LbMgBg6YMahhjTsA1jMCjynAXbdQ1Eqnpz478A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302627; c=relaxed/simple;
	bh=+cqA8/wuSyGM9iiBE4h0VHHPaUQIsjhmoiPddJyqEkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssxrUONhnGxZdg2nZVkQ2KnB7mNllN8Oi/ixQerzj7iYY4iEOIvmAvVn5BAe2JbV8WpT+I/9gJj1C/i5ocTEUXvXNIH1KPoi8WtfKu+r7fbL9swaej8ZC/gTwh5u9vH9vZYHG1+tw4vY3Ot1EIDKNsbV37mlCMPHR2UogaYAxwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sro2ciyp; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5174a0beffcso14356611cf.1
        for <linux-rtc@vger.kernel.org>; Mon, 01 Jun 2026 01:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780302625; cv=none;
        d=google.com; s=arc-20240605;
        b=CdSyORxXrDxmck3ijGIzPJJWtwywvBDjjZbuaJnbpqa0u7qd83UkHjh8dyxjzzo0Re
         MIPvtiArGS08/TBEWYNUpB9P0sSOJrdwo49bdH3a9z7EE28iCAlk5FxwkqjdlEwISqDq
         XcBEJkChZ17UUq6QuT323Pg1AbUtNGv9tFRuNzCtKooAO8PCVhCVFC3shsc1f+foAdrv
         /2PsZL74eZQU6ojrWLIH2LajzTbmG1RpAq6wpGtWUaDHHcuGb7F+MgS8pKZu2TrD4Zee
         KP/xuSMn62h2hKVqjvSwlEfBxPcmdlwP5ZbokZUKTf8TelqsmkpG3nlSIFcwIW7X0G6e
         pX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+cqA8/wuSyGM9iiBE4h0VHHPaUQIsjhmoiPddJyqEkU=;
        fh=UDfHwzo+h88MOj55IfdEJ2Y75XQOwovunslL2reR4zg=;
        b=ldzRY9rvMAiuacPrupzDEGTfm6opGMz8cF6o1Y2aMuaIw2dqhF5BnNnjredk0MnI5E
         iBOKgz94s7CEfVXdvVOYUN5OwaRdy1NT25LwxRbjEdTCIlKc2fGHnVKJ7xgJ28Wn/51B
         zft13VCOeGdjgXM0TZNtV7JpcxZaRpMdrXrZCdMVMHxucBxC4b3O6Kgch1YyiEZ6mtXW
         pQ785bPP4yXBzpwRhuuOhD7zJGsuana9awPLtImtRqxbBlm31PpuViWoKGH7cl2bUyF4
         r0XVb1QSz9k59MCfT8rT7NHnqjpcAFzZ5ZTtZfD05yRI6hKzBUNctTsXPOQjHY//OPzI
         x7lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780302625; x=1780907425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cqA8/wuSyGM9iiBE4h0VHHPaUQIsjhmoiPddJyqEkU=;
        b=Sro2ciyp3oXY60a+N26HQkBjl45fU6DbjYc+oWk9W+tW8r6acJ7AeDgICC5SWnPebV
         uQkVn6hyID9g2fskwtVveznfvMb3yLdm8EMHTjq4AEJgoWpJDqxVXtMciqprrF+/aKvB
         NAmCUfWlGvGYMd1qmcX6rHnJrnjUx4OxEzm2S99UsuZm10aMpYI+p1Hk1FZjW+qoQUIx
         179tNJGHPgxdEHGiOzVqUew6DuY5RuKLBpqq+DU7NW5Rz+u+rBbcICnoeuPtMy2VKr4j
         uNx+DfQA42sXdbfYGbCTOpNKpKGZUj81xloismkq7R60Bvn7Y+zL/AHHxjBa9reXZ1Mu
         vkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302625; x=1780907425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cqA8/wuSyGM9iiBE4h0VHHPaUQIsjhmoiPddJyqEkU=;
        b=edtXGX85Juwx1zRdL5WYEQER47jAo4QGVNjlcySv6PE6xOugwZs1Cb28nUJL318PZn
         y6MSEEuJrqyoUAeRi/vN2bjEASuuiw75+Vk4DnKv1ws2+C1tyRM3kjZa0qpm9r/plQwv
         eg5NXe6EVYzLacCta091Yg0P/5gTyViF8U66H+ZQAtLNKQql8Sw6LtRK2RZ67bJBGOSF
         +SlcmjXImyPvNsNyhgMXO2noM/E8T7VxOm4mVbE1qxaAWBjx+of6yqSq00WnEPZMQGyC
         /nhNlzq6mDATK4sGbPKbFBJbvSbeSbHWZgR5P1KA2bMBY4N8chMh+CsutiGivjMwp3tB
         4CKg==
X-Forwarded-Encrypted: i=1; AFNElJ/jwXczcRgeBeUt78oMr/lLZ39mQ2/bDbaPaVWtSHNmn02u1pogDb/zkP3/lJIIEiT6qdL0n9l8sdA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbw0Oz6e96z+RE7QGW64KX7w3cfsI7pA6yB52Puy/+BYTTw2OK
	+gF04bjnC5UuouaN0j5no/ZT9YPYusAQM74sOPWUDV2wezouPS5/zWyZeKg24TViuahpVJ5/sr8
	afDIo5oKZAZ1Lw1fD8gAK6dom7nXkwP6XVA==
X-Gm-Gg: Acq92OG+Qeixlz+uaGm5NtiObPEH1sHBkgB8rFGzToVSi/DoFKaGFAazHBWAUohJaBL
	WdQvuuhZQCGdsmUxKN6eGzpns9cM9K3QnHiZHPgdP6Vo5wGCrLY9NvhrIlL1Wgz0Y3iVEZKS7bw
	eXxKlOn0zINTAbMC2q3wbgl7Bes4ZvcJlGrdlJv8dBx6nsdzU2FE2nf+iRuuHTsYM2uangLwE9+
	S29SmcHhaNLu+qNHshm8/yRs+Wd4W9rKdNYsGl+7zLYQshsuWUNep5gDbLgw8tHNBcMlshgT0Pb
	k752o9U+/GSxgRn2/UmMmJFF7DbuCl9BTKXkU+p2iF1gcLH+YVoYbj6KJBdTdw==
X-Received: by 2002:a05:622a:1441:b0:517:573a:8a66 with SMTP id
 d75a77b69052e-517573a8c6dmr29832011cf.27.1780302625083; Mon, 01 Jun 2026
 01:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531171041.4149-1-challauday369@gmail.com>
In-Reply-To: <20260531171041.4149-1-challauday369@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 1 Jun 2026 12:30:17 +0400
X-Gm-Features: AVHnY4Lwngtf-XUeNp5Z4FrKFr3R3FlI_39W44ACGsq6O9x-X34aLbBKMT_wRdE
Message-ID: <CABjd4YzJoHrx1suMbhNvrMP+X=d=thvXYwSY=UD-4Qy=7-qmjw@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: clock: via,vt8500: Convert to DT Schema
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6597-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A649561B890
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 31, 2026 at 9:11=E2=80=AFPM Udaya Kiran Challa
<challauday369@gmail.com> wrote:
>
> Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clo=
ck
> controller binding from the legacy text format to DT schema.
>
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---

Hi,

I'm not sure that this separation of the clock controller binding vs.
PMC is the right way to go (yes, I know it's been that way in the .txt
document, but still).

The clock controller is not a standalone device on these SoCs - it's
one of the functions of the PMC (weirdly enough), with its MMIO space
interweaved between clock statuses and enable controls,
reset/hibernation control, system timer and watchdog, then again clock
control. You can't run the clock controller separately from the
resources provided in its parent PMC node, because all those *reg
nodes are just offsets into the PMC controller's MMIO space. So the
way it's done currently doesn't look like idiomatic DT to me.

If I were to implement support for all that beauty today, I would have
made a top-level MFD node owning the whole MMIO range of the PMC, put
clock IDs into a dt-bindings header file and just implement all clock
operations in code without putting those offsets and bits into the
device tree. They are not configurable, they are not board specific,
they just constitute the interface of a particular SoC revision which
follows directly from a SoC versioned PMC compatible string.

The only thing that would have showed up in the DT then would have
been the PMC node with a register range and a bunch of named
interrupts (not for clocks, but for other functions), a
clock-controller attribute and a single clock cell to pass arbitrarily
assigned clock IDs from a new per-SoC dt-bindings header.

I'm pretty sure there are no users of these DTs outside of mainline
Linux, because vendor kernels used board files, and no DT-enabled
firmware has ever been created, thus the only way to boot these boards
with a device tree has only ever been via an appended-DTB uImage (i.e.
the DTB always comes from the currently used Linux kernel source).
From this perspective I believe redoing the DT in a more
hardware-aligned fashion (and breaking DT ABI) could be better than
making the current suboptimal approach more "official" by encoding it
in DT schema. Krzysztof will likely disagree though :)

Best regards,
Alexey

