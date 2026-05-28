Return-Path: <linux-rtc+bounces-6587-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOCHIZtCGGoEiAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6587-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 15:26:51 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF885F2B21
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 15:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E571430048FF
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 13:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4655E3F1AC9;
	Thu, 28 May 2026 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhocV33q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092ED3F0760
	for <linux-rtc@vger.kernel.org>; Thu, 28 May 2026 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974513; cv=none; b=U3kK7DNEb3MdGA7twGFbmCa/fqAfdLRnHoEP7mH5k4rZUfapdOebZrSMHvDwT6Ed3USnWNORhBMOn/HtZdYZvQ0PxBHimUUNnXhkMIrDjogOG96shsWQ8U4C0/3t8TpBgE1ZglHEStNYNYgS+m/xD182+UIpQ/oQQ9cPtDIlFKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974513; c=relaxed/simple;
	bh=WczCRnxFIfbJSk+Li++oRjyPTMZ8/2+ILcMc1xcFWPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fZ47CyvdUGHyh/1d07JGQ4mO3fpZ3SCXbQ8lEX6uIkbh3B2brZNsZYt8oXBUyLzxnrqemsSpZ+jVG8RzUsM4mK7gKDxB4plGKoPgu9ZgTpAbjiIBFYiwzRc0J4xaJrU04mdsLPkYXCuM+59TjOIWI4c6PRgXHltZqcapjLup7m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhocV33q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77291F00A3F
	for <linux-rtc@vger.kernel.org>; Thu, 28 May 2026 13:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779974511;
	bh=WczCRnxFIfbJSk+Li++oRjyPTMZ8/2+ILcMc1xcFWPw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bhocV33qxdQDCW1JiL/qfTm1FVjBxspYkBlbRPwOyOp3aK5TI1NQSIeDDPmcsiwoi
	 UKw7JPj7bPXv/pnqyPNvJzfE4YK3q+XuQ9vWiDiCDHDCohDdazyR3Xo0P04+OPDM03
	 fCBahWsV7zRZIL9WUYfBSJdFMLjuJaI4A/Cjp+Z9xFUDZygcH9cosTOKmt54uax0TF
	 kjQ4YDD2+joNTTuoJjzyov/bYioUvqIuNVhKyPQz1jiK9xhzRHBy/SojW7tl/ENrc0
	 heDfi5DhxR8bHQH1n25/6HRjZ1tKf9C31tRocRmbpqwjlFYNaHeQlE82t88sMPt4+L
	 Zk+8pRFLVaj7A==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a884815606so13914408e87.0
        for <linux-rtc@vger.kernel.org>; Thu, 28 May 2026 06:21:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9SRTG8KEGWBpfKeXW8Feh5UDpzdzfy11gGJTG3u1yabKr9w7SsheWJ3kZnLZFFT7P59NVqS+ITSBY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywai+8RnKu3TzAajbRshVtl4FoBAMpWtBwcSmCZnVsDzO38TavI
	Kb4f7OlmpU0A3LK0FrN/xV+oExPv9exdDltwu6mD1WjTi7mRMLgITOKt3bShG7ah6Z3XxO9BM4i
	gJfti9YQfIYIUa/SpZLXZgBtDbierWLo=
X-Received: by 2002:ac2:5594:0:b0:5a8:6df4:6ad7 with SMTP id
 2adb3069b0e04-5aa3239eebamr5916994e87.14.1779974510431; Thu, 28 May 2026
 06:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779950275.git.u.kleine-koenig@baylibre.com> <d14b9076b2c7703708bcc5cc35f339cd97fc10cd.1779950275.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <d14b9076b2c7703708bcc5cc35f339cd97fc10cd.1779950275.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 28 May 2026 15:21:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLkug4Q3XZbsyFAGMre47A-G_9jd6=Nk6m-iHipXm7CoVg@mail.gmail.com>
X-Gm-Features: AVHnY4L8ZQEo6oCaX_r6b-iZZdK0XNz743h3p9zf0vvzpKnJPXJQd-y34D5kroU
Message-ID: <CAD++jLkug4Q3XZbsyFAGMre47A-G_9jd6=Nk6m-iHipXm7CoVg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] rtc: Use named initializers for platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Karel Balej <balejk@matfyz.cz>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6587-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[bootlin.com,matfyz.cz,gmail.com,samsung.com,kernel.org,linaro.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DBF885F2B21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 8:48=E2=80=AFAM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:

> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

