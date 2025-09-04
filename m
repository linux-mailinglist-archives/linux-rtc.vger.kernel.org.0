Return-Path: <linux-rtc+bounces-4835-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7EBB43D2D
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Sep 2025 15:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C55661882E48
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Sep 2025 13:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852D0302CC3;
	Thu,  4 Sep 2025 13:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wqmGvf53"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3F43019D9
	for <linux-rtc@vger.kernel.org>; Thu,  4 Sep 2025 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756992513; cv=none; b=YanbyWz2iB5DfT3NFeG2mVGtJwUIm1Ii3lmYTYKpG5ZxsLxeWKVoUUzfv2v70lhX3ALNY+Vz011O+kHsu6nE5S1FXAdTyInjbYNbP1upVCgULUPNue719H3RE3DHMI1VbAF1DU+n09SsDzJKiERZ5v9ZUrpvkj5pHp5bD2dvuRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756992513; c=relaxed/simple;
	bh=ScXnF6zPN2urQTV2s9IF2aE1owi1if90/n87/FgC/yI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aKQ5NqmXRGhnP5y4rcgDIcQQMvzg5nZlXwQtfQjdQHt+CDxkuoKn7N+r7NXiU8dB84DLwrTFUp0b+CugCyXvCBfr7LzLlC9F6WOW5n3e2iRODlBBZ8X/0hl9E/KyuWQLAtTxkXnJtp6Tfry41aM8oMQghi7Knrt992AFk09btwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wqmGvf53; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b7722ea37so5227985e9.1
        for <linux-rtc@vger.kernel.org>; Thu, 04 Sep 2025 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756992510; x=1757597310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wg9RQ81pLZ+ciihaHbHh+VHe51/1jd/flpRJCWP5vTY=;
        b=wqmGvf53RXEbz5cHRxj8MEPL2DvWA+VFmMQjACA+J1kI9BBnJXNB6fK1ztSP7jL83k
         LIKMWSGr4+RfkAy8VMvZg4bFEnlREE4TkMCRNQCsOXseW0MuJ03KZbvXCzFxIFxYutZ2
         gafSmON3AbjveNOla3UzstA/VJJK+pbD0PGWFsBIiWJrOWwxmcqih8zRi+VPvy1sGCXS
         3i2+M1qx0VU9PefM8oocRSHXFv8/fw7+OR04FZX/x/VDQj9S5Q2Ip0voJ1EQA6/NqwFE
         td8E9wnmMrhLXAja0i8jsmi+FGT1gXobc0iUxYM6c6Np38SQnNl0yY10m5pED7HotDKj
         6JRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992510; x=1757597310;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wg9RQ81pLZ+ciihaHbHh+VHe51/1jd/flpRJCWP5vTY=;
        b=d5Zsohs3KiM92S4WAI8Q6sTVTFxQaC2tDZWO+6Qk+ATuFqNbMlS+DdrLin6T64/cwL
         iE335AbfOle41JLyPa5SMlfFBTHFqPRIfUiLPk1aBvmZJJ0z0U3rUOpec++YLvS62ZjN
         HNQa97aRZEJyA3cRqPPkDjOH1ef5pDPObxXFMT4jNunJOBxvw0DDCSv68Z1kxzBW+lEx
         /aK/+yTjerw5gcsU2HQzJs+LGOdtztnWQBigsop+W3DLadc3bBUND88PUSiGIlvHBM86
         YDFkSbi8mnwYXdElzbqHhHVSI0FTFS96uJt6YEUnFH/H8oCpFqOhk51R8208ryYPwLO2
         ut4A==
X-Forwarded-Encrypted: i=1; AJvYcCV4MiSyy6MFDxKBbr7CXvY5Fc89HEBgQGBAaCL+OG+O0V2hJwNxnd6U3TZzYU40bWWfC4dmwIAkTC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSI2zQ8PEIChap0BeqCk3S9p0+d4+5CyrrAY8Yuuw3kzCE16A8
	JvFfw1JUmhjWJ7cTFW5LMa7m5YTZ884ulC1SvO9xPdI8s4MgTH52Y523G1Jh5d0sMuc=
X-Gm-Gg: ASbGncvNw9UQwW6WYG3N0QSCMu1VCx3MyRq8ldO8PShVQEegGo58lMsvrzS7KPOb0Mt
	LMS5NY5ahAlQsOuAixxrDGUkgz080+vJ3rDEVyIk+CD9X5UiybPW0x2WoJ6r/xXzRZU+7IfnThb
	PFElaG3b7gPno6+jXvvIJkKsXo8rvslG+9N31173EnvP2lFaI/EpVyjVp8MWI+7u3sCtzvpTlFa
	BnjY+5dsbhvr56bEmbssI7jzPn7Imm87m7HpvUsT6weZdNrxxSPoLNK2Jz8XuBNzijfAsXKDG71
	Q99U42hNjoyWFZulNx1mzQfVPYTA31OrNIcZvFcQnamNXAwbgCiYDTfsVOo4dnLI6QQRHy5j9Yi
	bV96hG0aSCJ+eqVlm4y/yCQsNFsadVsLDXnuQU7ivt+M=
X-Google-Smtp-Source: AGHT+IEqR0+n4/kIxFH+iZ1e8ctE7JnfjyeZG2z9hWnY3yB50qjsaKmYnmnDkhp/9C/R0KCDPHIUFw==
X-Received: by 2002:a05:600c:331b:b0:45c:b501:795c with SMTP id 5b1f17b1804b1-45cb50179cemr38578945e9.10.1756992509525;
        Thu, 04 Sep 2025 06:28:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8879cesm286165305e9.12.2025.09.04.06.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:28:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
References: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
Subject: Re: (subset) [PATCH 0/2] rtc: add amlogic C3 RTC node
Message-Id: <175699250880.3374853.13696019102809895067.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:28:28 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Thu, 17 Jul 2025 17:38:36 +0800, Xianwei Zhao wrote:
> Add C3 rtc compatible string and device node.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.18/arm64-dt)

[2/2] arm64: dts: amlogic: C3: Add RTC controller node
      https://git.kernel.org/amlogic/c/59b4c260582a74e641c973d016725e5dca32f300

These changes has been applied on the intermediate git tree [1].

The v6.18/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


