Return-Path: <linux-rtc+bounces-2707-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8286C9ECB93
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2024 12:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FB291886762
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2024 11:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD408211A2A;
	Wed, 11 Dec 2024 11:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBFT7lJ9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07181238E27;
	Wed, 11 Dec 2024 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733917931; cv=none; b=IqU6BEogddM+eHCiG6UAPUXqpl2B8IMWwXRaftJ3bk8U3DU2gdZloM84NVzp/LDjby9JBbtamcf/01tMgsqUv3JAH+LW1FiRuT8bFG+sBpVQzMSDGp/Mtk5OI56qXClWSjY7jtZO/I9fbwcNlu3U04/wZJzfvDLPbzPBf/h3FNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733917931; c=relaxed/simple;
	bh=0dlKlBt2wGpwYPj5+vwahTBlNNvq1UobXTkcxTlVIpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9fWc07Gasb1FN/iS3Hov+vq7kzkjcMbQBsJgtH5CGIPrheGbYho0MIfDmImKYbWU6fCES1Odozv2kmvOdyPM4hqzDAp5GrtNE6H2gUO5NHyGgSb0yqN4tp/1/q1ryeFUOUsZMv6X5XGe0VXpC7EkINO45JTE9tkCY9ozMgE9+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBFT7lJ9; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa6aad76beeso223102966b.2;
        Wed, 11 Dec 2024 03:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733917928; x=1734522728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6KHi7ydBN8vl76m68JaMlwxX56xm0y0S8GMkLZ6SAI=;
        b=MBFT7lJ9rMzSQKXaQGpWaaJF87M6NiqZMHN1W4zF/ALB4cGUrVg1RNbdWIjC00EWRZ
         oiXVslU+KZCH0Uc/KOlrjtdblXhoZTWO2x17++rqy83IJT4Wu2rfjVdLxUonjAVSGt55
         QAikuyfPl2CV/0LyjfxnwTMilMIBxbEfSvZBY5SyB1BFL4LbLeR24z0set3egMlP+P/f
         yUdyqowOYm6DZErm36uNA9lQXReTJM/HVFl20JNrEVFE6FBqZUst4YbscdrL4Qm0IRap
         IbNbRVRVbKHyYQhcDagrlzFnda65H9ix2mqWztGBl1EeqEyY7ltsCpzp/pTeViUmUfeS
         mYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733917928; x=1734522728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6KHi7ydBN8vl76m68JaMlwxX56xm0y0S8GMkLZ6SAI=;
        b=gS3bqa8XYAvwAaQCtjYTypMtmpRTH07HSzQf9fKOSSXByhVosO7gLCQ1oQ/739U0S/
         5c3RHdgtWr7ikgOHzXk684CUHkSc5HeRKx8YCxTvJj4LQc1O4Mzm4bOh745XcUD4a8yh
         cfRiYjdSgHtWidI/JXPq80mWbmghnLq1FYgMktTpJrAjKtLG+HzLE7cpMLN+u9q6H+pD
         E3z0XaY7zcU2zQnlQr7S83sSGuJz6Ux+i8t+4D4at43fCXjJ1VS4Rityt5zAEW2IfREu
         2OY4puU7wYhJwvT8l35x+kk2zIslGpZ+B9PPCth2Uxhwlwpqfj547kYaf20aUx8+Z+6D
         41qQ==
X-Forwarded-Encrypted: i=1; AJvYcCU77ij+oMZ7QhrmKWuxbfRkfLYG4yyO4YA6NvjWfWZ/80dSW3LNcGKoQvQo22x9X+gTnvPmQiYNpHlCHTfC6Cg=@vger.kernel.org, AJvYcCURlKMqwZiM1XTJbYET6iO1aRirYrx9GGKUVcnbYyNXibyeTGBLG96a9Ph/k4AB/WtOBFStRFhHlkE9@vger.kernel.org, AJvYcCWOcTw0NVOqazg+HL2QpjdklspxkvduAi1sRB3lRqaYoiFkRvRiHGvtiKFz2K1KK20of+Pr98btNvvxim9x@vger.kernel.org
X-Gm-Message-State: AOJu0YyrUl91+hfYtM8vosvr65QDwnH45y+sd+HILUHHBTYcZNmrGXk5
	ofLg3QrUbLT8brwBd5qJmppG81T7kGvgkk70bQhNjokcRaX2xNNsd12ykSN3hjFf9fVsYVIo/5W
	HhyNU6DEDiVu1GSQZZdnTJVIL47U=
X-Gm-Gg: ASbGnctMiRJ8WQ9jaVoZpU+A4dRpU8Fo3Qudgk+Jw1/I7Dt4eCyXdW0K3iA81LuTYT5
	DEsUC2l/tn8fMotH9r3/i0AOHdbhmQA/ltWM=
X-Google-Smtp-Source: AGHT+IGc0NsLP01gNrHKgvwWOHLAEVzBmt5PljTMTQythHC5r4nU9NU6QHSBAku8yajx+eFmzTgyzefxM+/JiYFh0ew=
X-Received: by 2002:a17:906:cca:b0:aa6:6d2b:cbe2 with SMTP id
 a640c23a62f3a-aa6b1192f69mr227823466b.16.1733917928112; Wed, 11 Dec 2024
 03:52:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1074175e-5ecb-4e3d-b721-347d794caa90@stanley.mountain>
In-Reply-To: <1074175e-5ecb-4e3d-b721-347d794caa90@stanley.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 11 Dec 2024 13:51:31 +0200
Message-ID: <CAHp75VfssNnd9zvNu+N9xc74RO+qBPC_qhF5ed_G8p5HJ8LWvw@mail.gmail.com>
Subject: Re: [PATCH] rtc: tps6594: Fix integer overflow on 32bit systems
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Esteban Blanc <eblanc@baylibre.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 11:32=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> The problem is this multiply in tps6594_rtc_set_offset()
>
>         tmp =3D offset * TICKS_PER_HOUR;
>
> The "tmp" variable is an s64 but "offset" is a long in the
> (-277774)-277774 range.  On 32bit systems a long can hold numbers up to
> approximately two billion.  The number of TICKS_PER_HOUR is really large,
> (32768 * 3600) or roughly a hundred million.  When you start multiplying
> by a hundred million it doesn't take long to overflow the two billion
> mark.
>
> Probably the safest way to fix this is to change the type of
> TICKS_PER_HOUR to long long because it's such a large number.

...

> -#define TICKS_PER_HOUR (32768 * 3600)
> +#define TICKS_PER_HOUR (32768 * 3600LL)

Hmm... And why signed?

Wondering, do we deserve to have something like
#define SEC_PER_HOUR 3600UL
somewhere in the headers, if not already exists?

--=20
With Best Regards,
Andy Shevchenko

