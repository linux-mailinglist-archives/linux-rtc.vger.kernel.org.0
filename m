Return-Path: <linux-rtc+bounces-965-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C8B898613
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Apr 2024 13:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85A2728846A
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Apr 2024 11:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D41A839E5;
	Thu,  4 Apr 2024 11:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COZ8WqEA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6342F82D72
	for <linux-rtc@vger.kernel.org>; Thu,  4 Apr 2024 11:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712230354; cv=none; b=qTe9GZ5SbxMS7Kuvmqo3K/svQ8qaZgX7JHdJMbdm0+UBMIzfKAjpVH27/XV+tekODQQtbvCsaVGvHZDhDWDAiUtw80UXLf6U1gvZza4k+lgnjWf/PEkefQjOqLks079oK01GQSHodyV4KNHj7jecEm2sBUBjPmZnDt5mPoV8SbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712230354; c=relaxed/simple;
	bh=wUwTbBI6FvC+9csBIWb+K1MiF218QWtdW5pK12heMYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrTHZwfoDWhw11TLemgBFo4sAkxAqdBd9oA/nfcCCta9KMw3nFbubtNR19SMnKBJeZ8K6EFo8WfQBWagbEXhYFDvMovDnITy0wRzoEo1D7WwNC7a8x4jWUhXGqLuaOxj2IfV2yR4r6TOOXsu8PscHQQyPgXStjjl+SQzZzCuW2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COZ8WqEA; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dd14d8e7026so852724276.2
        for <linux-rtc@vger.kernel.org>; Thu, 04 Apr 2024 04:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712230352; x=1712835152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hqMPpBRPBNPrxNkvU21NJl5hteTV5S6UOoiZfBhbP8=;
        b=COZ8WqEApBJO+XlWN34aRYaTicUU3XmrzS3aS7W8uF+BKmFeaaecN2aI1erxCps4Yk
         MzIk+RWHvhRdhK6yhQ1Krs1IYd3h6/mrZJkZV37eSTqkdjEte1AK7Fy9XVENpLpY9rBw
         Y8z0ShlLGI0iAiGde1enoAe8RJC08+nzDncNJgrnAlTNHHATbig5jjJ7MXtxqGdPhjbt
         9DfRX8Y43OrGH3kIqDp2SGZxqvzJFvKOVivAKWZ0MezFGtMeOPhZ3ndTi4qQlcsJglQa
         xzW46CucLFv48KTspHqXKHEKCglFWuZAieVhmlSA1MNiZl/v5chzyeAZRKSRRIuL2rQ3
         vQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712230352; x=1712835152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hqMPpBRPBNPrxNkvU21NJl5hteTV5S6UOoiZfBhbP8=;
        b=ikbneP6M9IpJ3g5b41+PrnGDDRjgFejO/S5RyQ+mdzbNRAQx0GD0Ij48yWUgHI3Usn
         hTX6HOuagEljdbZKanipAIurObMQQF4rXZC7ybyW038LJlUDf+HUTGzsZKmtAJePYZjT
         kVZ3w8AGHAkDcxjvcBOQ3WuSJ/lU+hO6EzjATuz1QkOMvIf4jquwqrbn+JSxqmhgiUHU
         CHpFWhL+aDRvBKGngLK/qVVAWSbRUQj0Grapueiub7zTz460T6TEiRfWqZumT0ygO6IJ
         p9enSEy26k3k1rbb2Rvs5cH3MA/bFm84WdXltqdbT5zFCfwd8uighcckEKrBC9z587wd
         ZC+A==
X-Forwarded-Encrypted: i=1; AJvYcCUWlzL0mIVw6YQckrmDouE6K1v2gRbOQboiBQmWonOFaa7Y4uXZZeoVko/No/3+16Y0Ub5n0L1U+OOvVDNX+PAPOPdstHNIxiAY
X-Gm-Message-State: AOJu0Yzvj/b/YBM1lcUVIciVTA8DUylxBDP1jNJj8vWe9fnob8+EG3k8
	y8a+MwT20M2jYVDJKTgmDpC+2Ok60K2d7epQ3C3xE+m1TUAJPK9r3+2pCQnYRRzS+9K7Ge5Q5R/
	snMiOcRESumRS6ljhhh8XL/FzGn2DVsZ1YaWXGg==
X-Google-Smtp-Source: AGHT+IF8EfX9KQQ1p4iTi06dX8tZK+FXrkWjcL6lXHqjNaEzB+PCWJA7HAgzLCdOea5bBV2RrgagddXs06++gkV4LIw=
X-Received: by 2002:a25:dfc4:0:b0:dc6:e4f8:7e22 with SMTP id
 w187-20020a25dfc4000000b00dc6e4f87e22mr1960662ybg.62.1712230352423; Thu, 04
 Apr 2024 04:32:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240329075630.2069474-1-tzungbi@kernel.org> <20240329075630.2069474-3-tzungbi@kernel.org>
In-Reply-To: <20240329075630.2069474-3-tzungbi@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 13:32:21 +0200
Message-ID: <CACRpkdYGH27Z3YKN4b1y_ZeagbtYqX1Wo7BXnyKsZ=oH-FoQmg@mail.gmail.com>
Subject: Re: [PATCH 02/18] gpio: cros-ec: provide ID table for avoiding
 fallback match
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, brgl@bgdev.pl, 
	hverkuil-cisco@xs4all.nl, mchehab@kernel.org, sre@kernel.org, 
	alexandre.belloni@bootlin.com, chrome-platform@lists.linux.dev, 
	pmalani@chromium.org, linux-gpio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 8:57=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:

> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.  Also allow automatic module loading by adding
> MODULE_DEVICE_TABLE().
>
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

