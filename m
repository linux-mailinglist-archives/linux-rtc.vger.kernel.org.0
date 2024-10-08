Return-Path: <linux-rtc+bounces-2117-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D23C994407
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 11:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E6F51C23D5F
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 09:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DABE157465;
	Tue,  8 Oct 2024 09:19:34 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21361422A8;
	Tue,  8 Oct 2024 09:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728379174; cv=none; b=NTICJrptDsMxfOLOZELAtvYf/SJFqgdKgYrMNleYR5D4qwevWG0alcWRHfOc8OogD+gPbO+dBpMHfjxwixAvTxKlc2yoX7Nlw85Jk0VPB2ZIDJcQHz1DCqlY1l0OB+FEBIvL2NAdlYqrGQ9FkCfuMw/SA1jCSfVsyiahBLPvZA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728379174; c=relaxed/simple;
	bh=mniWzRf/z6PzV05XjmEwI0uQV6qrURP9GRSSBTFcSHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQgyiegdafaOnMCtrUNUQC5sdN/t8kj3xBc0czlXyoePn9s8bCMm7TA3uwGDOObYt5XnfmqG75pkXCHj7a8xjSJWeDfx/4Ay0XucFD3Z5Xal9X2mDaE71AX+8+24fspYWt7Jfiu4QBcg9fgDC2CurzZc73Ynv/TYQ/diKW6FoGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6dfff346a83so44262887b3.2;
        Tue, 08 Oct 2024 02:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728379170; x=1728983970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McrFJhWoFLthcX2r06lwIZtP2OwgtLED+X1B93Ic3E0=;
        b=pMP3gJyC2Qzc5T5XPd3nO6pXeBeRjgGqkEQNe7sz5MPF8cMWYutlnGTG/8i0yPIA2l
         SZ+/OPkLrwrBvofe8NRz5AaUWaiI0uKUgHY8rUXqmp0S92T6limx6VBTleW+ENgIf3FO
         v4Gc9jC7udGkZk6UsThM+/Dy8Vr3mPAv4UhlOvNDzWXdImLdepVm9A39rBorCvYPApFo
         EUytTqzispSP1xMRa/x+VottBMTMv4xwHXMIo3lwxuqiZxJI7k6ZNXLhEg44C98o/P4L
         xUWCWrs5ur4OZWLuh7Uh0jCAiBMbpCIkVZGgb78P+TUAoS6TcpgoyvTFcfg9QP2G419h
         2iAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBBXQplqXTCH3lq4VHfA5+3r9lUQ86+UWJgLTNXhkwVo8pT9sDTWxk8amShuW5XuMCZopC2Ehj+q59CA==@vger.kernel.org, AJvYcCWAVhLAfbBcfs1j+sUsp1wa/3LXKUJlRnGPWz5H/zoCbbPdWFZAbslw3MbiYdveFIBzLjtfaoKLKOYwzow=@vger.kernel.org, AJvYcCWqskLnaiZvfs2CsF4ZurLAmj3tSuTt2rtaXpxD9vZL5tnhjiRgFSAx7L1GsR29rRKd54BMkREuFCPk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8EkwPVToi4miu2e1NHBZlIsCAqmTLovZn+eN+RSK4c77uOeyT
	9cLE5BWihu+GQGuat8XB7SnGnzgD5mc6esNrVv6aYKiqj0Ht/SWquMb1ODa1
X-Google-Smtp-Source: AGHT+IGMYqmlBIAij/MbHOFHCBAWmQLXEC2n8m6MlCnQpEBnyNkLwsGRsWlJLPcJ2EDN2y/Z/+wHTg==
X-Received: by 2002:a05:690c:f03:b0:6dd:bad5:c763 with SMTP id 00721157ae682-6e2c6fcba05mr140915577b3.2.1728379170674;
        Tue, 08 Oct 2024 02:19:30 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d937919asm13766727b3.51.2024.10.08.02.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 02:19:29 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6dbc9a60480so45501987b3.0;
        Tue, 08 Oct 2024 02:19:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXvWIKMq0lf4FNaYZgUArYGISb0rPbvtZDD90GMg0fUIadmhaDcQrv+GUE+RGqm7KtdNGUs7hhmGBjYQ==@vger.kernel.org, AJvYcCVBoyb72j5nLrDAW905RNFFY0KqnZZmkuY6pGX5a/q+V5LgIoNiTqNXrbL4kEUZx90Q34G8e77PX0NI@vger.kernel.org, AJvYcCWX4b0Gl/dt51q/kBkkB3Bdv1k5Zn72dlRqFUdWAfLPmHBrFRDxBZzi0fkdNU3gIRiCZqPi/jHhSgFz+CQ=@vger.kernel.org
X-Received: by 2002:a05:690c:6084:b0:6dd:fb48:118c with SMTP id
 00721157ae682-6e2c7289faemr131719637b3.31.1728379168050; Tue, 08 Oct 2024
 02:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728377511.git.fthain@linux-m68k.org> <41e9f3f320a70b4d0946f7e0c3622f1dd1e8791c.1728377511.git.fthain@linux-m68k.org>
In-Reply-To: <41e9f3f320a70b4d0946f7e0c3622f1dd1e8791c.1728377511.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Oct 2024 11:19:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7kyLQHc8e6sL7jfQSJJWjkH29M8T7SWCgnKuJyh1xtQ@mail.gmail.com>
Message-ID: <CAMuHMdW7kyLQHc8e6sL7jfQSJJWjkH29M8T7SWCgnKuJyh1xtQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rtc: m48t59: Use platform_data struct for year
 offset value
To: Finn Thain <fthain@linux-m68k.org>
Cc: "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Palmer <daniel@0x0f.com>, 
	Michael Pavone <pavone@retrodev.com>, linux-m68k@lists.linux-m68k.org, 
	linux-rtc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 11:01=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> =
wrote:
> Instead of hard-coded values and ifdefs, store the year offset in the
> platform_data struct.
>
> Tested-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> I tested this for regressions using qemu-system-sparc64.
> Also, Daniel tested the RTC functionality on his MVME147 system.
>
> Changed since v2:
>  - Use an int for the year offset in struct m48t59_plat_data.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

