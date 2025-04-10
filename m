Return-Path: <linux-rtc+bounces-3911-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643FAA8476F
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 17:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3EB39A45E7
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 15:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB881E5B70;
	Thu, 10 Apr 2025 15:08:25 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F2784039;
	Thu, 10 Apr 2025 15:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297704; cv=none; b=ONSIMxQEeXcDyhNOLzZoI/8IRuZj7rJHbZC0MxeG4LzaVygsVogDQHauHXfBZJptxXQ6g29IQVd+Wvf0i7ndZX/QH75XIImROoNTPzpoVF2rUPy2J3neOOFexwO4Z1hAfm5jK372b0IW0mA7juKRNNhpFQ1D7bUaxxgorxKeBYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297704; c=relaxed/simple;
	bh=CqchYWT2D/NC0O3I7WLGcTVNEMhTZnkBuN8MRa6K7CA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OoBmOALC8UjAtaUJiy4B8rOwWdkl/psXlnQI1GJfrqNPm5VhJD0BPGtusNqlMdlaRzWBK8g+hrO5c25/iN4m1wJm315Hp1+57bn/vAKX0hY/BRYKY97dzwd4DMmhj2ZHdwxs+EiR2lxGlpR/Pgmrl/bn2jWuzLfqXxkPKzYOxns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c5c815f8efso92109485a.2;
        Thu, 10 Apr 2025 08:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744297700; x=1744902500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tzgiYMuNjRPr/NnukPcEQeYPbDzA6/5QMvPOZ9yhVQ=;
        b=FDdZrTYn+dmveX4m4ZBtDbjbIq3hZgfNjEwxfekm6bClE8v9m5um0BKaePfUHOk/vS
         vccDwfv9r/Pr9pG9VfhtEwIgGOEueGs+euBf/3RoXqSjJSGD0ygYmZuoeSG28XbgpTJA
         hCTE37pR5hhFQaYLbWS/EQUFQGGtrR5s6GeipvAQbPN2OUgr/DJYmhLbrZLfO3TCuZT7
         kM6bJGPVCKvyomqBRSQUNOhFmRgxVWCXQec8mGAgKXsQlIeltBEW5n+b+74LnrXRhPGS
         LoM6E3x0DMRCERJkcNgG01i9hHKYYrVgx9XBvhkajN9FvK06su2aV4G9dPVOxqm9giac
         MiTw==
X-Forwarded-Encrypted: i=1; AJvYcCVABqxAqhtpleF4SHsNypvGkWgtVj/hAYNlVMGRlHwyrnv4A493SX0eQVCvQ5TvOnMuTKS0IIEVeFRb@vger.kernel.org, AJvYcCWYNkj0QUvMg+4jM880qBP0nIQEKV+WUOjAEEl6WVe/6TycagSIZLvkH++D1XYvExFjX5L7WHRvKCLF@vger.kernel.org
X-Gm-Message-State: AOJu0YyBMxLmxzOp242XJ1oa8Ca/7DC4akepoBLgjjcb/p71YslGDwGH
	7GLXK/9kJmuxUekNbap59IkvPUyh0vaKuCPr4eOqbumKeHpIXRqPH8dXPe6fxDA=
X-Gm-Gg: ASbGnctV0BXZOUngh4HBpbqRum6UVTmDVZTbddrz4uLhZ5YAOmEEtRtGTZMb0dfKmCC
	CQFHJPJetj9/xus6/OTBH+1A2w1J9vzOnkBGDkE1PxIAIVraDRxpEhOi0nWmQ09mSr7q3OmAb9B
	gHA1BCXF9/1z/YgzG33jqF+9/9HHG6fV48MI9z1P+obhpGkHRroEKP/WDFNxalamKUlKfcrIbv1
	l8T+Pabr7S/7LPWcqNlGUm5YvPlqOaHslKboSKGHrFGcwxGJQLFywczfSDVHZ6oT1woALGrCruA
	womsXS0Fi2Jn75PgavjQBZvSRoEVO4eXcZJnhevOhmU5ObvNO4KUhQYxIpuY1zMmyJhnRtCWrut
	pa+RXln75VZCGpFl6VA==
X-Google-Smtp-Source: AGHT+IGGn6ysaFg80s/SeK1sajpfm8mg4onYrR90us4A41+WzSsY9V8KcBf384704IZwkQVDgbdJxQ==
X-Received: by 2002:a05:620a:2451:b0:7c5:49b7:237a with SMTP id af79cd13be357-7c7a815f699mr308664285a.19.1744297700063;
        Thu, 10 Apr 2025 08:08:20 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0dc9fsm99105285a.96.2025.04.10.08.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 08:08:19 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c55b53a459so105358285a.3;
        Thu, 10 Apr 2025 08:08:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+CLK/NVkJFqSogLuEETWxT0IIv0FMbjZKTUsjsMi/gZk4i2h0A7lf9RtlRtqdUPKGbkLO8t6eOiX2@vger.kernel.org, AJvYcCVp8S8N5Cv2H4jmSva+Znib89X0+NZx0IDElnhsRJvLF90L/MxvausRP5FL7reQ/6qjpjONEd1HwU6a@vger.kernel.org
X-Received: by 2002:a05:620a:4608:b0:7c7:766d:9b00 with SMTP id
 af79cd13be357-7c7a81b14bfmr435816785a.36.1744297699130; Thu, 10 Apr 2025
 08:08:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319110305.19687-1-wsa+renesas@sang-engineering.com> <20250319110305.19687-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250319110305.19687-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 17:08:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiNYXVzK7hSmgqZ65gq0bJyGkfJU0=u+q5K=Sb8EY3ug@mail.gmail.com>
X-Gm-Features: ATxdqUFYgBaM3UsFkmEqOJyJhgysWeLZKq1MqLUlKFkzHJ4ql8L3X-9v3xfrwGw
Message-ID: <CAMuHMdUiNYXVzK7hSmgqZ65gq0bJyGkfJU0=u+q5K=Sb8EY3ug@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: rtc: rzn1: add optional second clock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 19 Mar 2025 at 12:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The external crystal can be a second clock input. It is needed for the
> SCMP counting method which allows using crystals different than 32768Hz.
> It is also needed for an upcoming SoC which only supports the SCMP
> method.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> @@ -33,10 +33,14 @@ properties:
>        - const: pps
>
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>
>    clock-names:
> -    const: hclk
> +    minItems: 1
> +    items:
> +      - const: hclk
> +      - const: xtal

Shouldn't the second clock become required? Or do you plan to make
that change after all upstream DTS files have been updated?

This is orthogonal to the driver considering it optional to maintain
compatibility with old DTBs.

>
>    power-domains:
>      maxItems: 1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

