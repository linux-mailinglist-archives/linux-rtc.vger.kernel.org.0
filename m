Return-Path: <linux-rtc+bounces-4739-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A446B308F8
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Aug 2025 00:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31E2A7B0F68
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Aug 2025 22:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD532C029B;
	Thu, 21 Aug 2025 22:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ddlvl2vF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36DE2877CB
	for <linux-rtc@vger.kernel.org>; Thu, 21 Aug 2025 22:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755814698; cv=none; b=MDLOK1b76uq3paqOe0uoyXJXt1gxE0hN5P/OWVwGVngi03dFf0ALQCvXrwXqAPEmPSe3wrGzGwiZLvyLURhQIiZRzX3X2aYFk4KpPepPWBUDE/Qd1PTorgJAbvHVP4/lVL4+lnmeYbO5ZnI7+EDKiUBuIEr4Vl2VQ7+SfXdndFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755814698; c=relaxed/simple;
	bh=hJvLmDOHRH8htVDkh8Zi3UnZ6HEw3OYx2eFdQyAdZEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1B4ZiusDU4XdIGltQKLDxGLJV9x/NACHIe6bWFy22IE6TaFGSQdIGW9Bll7MRcOPelw6CLCrD1U6kzxFYTLKGmBUnLAYOP27ssNuaM6j7cx6q6WdR2GYZ3wlOV54vOw8hlF1q5rNZcjhintMNOaAvfVRNFVP3nKpjRCF1BydVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ddlvl2vF; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-33548b0f979so11133391fa.3
        for <linux-rtc@vger.kernel.org>; Thu, 21 Aug 2025 15:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755814695; x=1756419495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJvLmDOHRH8htVDkh8Zi3UnZ6HEw3OYx2eFdQyAdZEU=;
        b=ddlvl2vFfSC7cPidCuNjxai5SVOm9E493/urLmHQ8fZL9CMGMmebB+BSNOqXJ0ztVz
         FBnYt4bEkbD8XHQ75DrNuzdo/kraEIRrGBDQALiRnyMBEg56U58tKwOLhS6dr8zbpxEd
         dIE4h9gTiW1mMgoWKqPGHfBl8AQ1epzvNXPRuaqN9dY3KlpFMnzcsEkwb2yyZWeAkp05
         rS2hw8GKg6qkvO6vi/zs9/Jh57ViYDhH3+yUsjnfHNGarUlGf1rPPH8eCwIhK9Nkl6gf
         2XYNfFJlqNLo8cBQH7LKc1+ylEWmuX7dPAC7hKk4xyVkMgO659B00Rrw4CPVjxaUYQBZ
         YgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755814695; x=1756419495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJvLmDOHRH8htVDkh8Zi3UnZ6HEw3OYx2eFdQyAdZEU=;
        b=kwPONLSAHYScs40MITxJdbl7L2brJiUQ9AjUhm5azSEo4LYkUt0k6ElRDwpbUNgYF1
         NHqZefGClx9qbo9pP50n2Q+MOUehuYns0/mldgW17gyUPgUNRYULp05mpMFZtKmB4nrV
         pv+WY2aHL28LhQ69gjItSZIx8iRM3qjGTPTByCNFP8Iczdrgf23sE8SkLknHQSIbmF4w
         Al5ocMYoDCFum4dJUmzC4YgGeAbs1DW8h20iGm7huh2OcvMc32i4M/FZEnqk5ey8GFFc
         K9uDxAoOVhx26rXgy0+wmjmRR7ggzf3xPEjJ9tGQx994C5UHHDqEH04sOLPmxO6kBECK
         5eOA==
X-Forwarded-Encrypted: i=1; AJvYcCV/GoRGsVHa3+qs+8JVf3V5CQJQZEIflmVlV5YQ+U2zvEzcO5aNsApQ6TNh5itUTWqoP9IWAFnJVME=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA1YTUgOoZvR+J6YCoYI9qSz8A2pf+nLTMDZRok/zZ59/tGCmZ
	la/iC7CPiq+Ki+pO8GQf+k7rM2hfnsLF4olFaNGMYKm65v390zJAzbMACe+1psFl/vvqPizyT6n
	pG64K2LPB3CPkmFmFMMMFQEcAqmLbQCWPKaz5KWLkFQ==
X-Gm-Gg: ASbGncs6yQsjSe9zoUO3lBPxMhjUAk7dHaeMgrUxg0u5ERmz/7V2RIlz0q559UCdCL0
	meBo9YkMyc4QTIBV9OoOAhMj7MsQ8+JDry9OjfHCjbH0roMTKCo9+Jul44TqZrev6gzllQ1WGeq
	ERLUTjc7voghIYvTn/MxhbrGmwoG78yrDhcf10BKTaMNhaqUsNvyRySNTFX9+gGg60POxKEJ3Ir
	5jRS4A=
X-Google-Smtp-Source: AGHT+IFrY2hS5SsxaMer/fv4j+sLFV7Lrat9cyli9ISfVkjiqJsId841iqyuhRGNs237tnPBVWSS/MeqLwPZ7xMQfUE=
X-Received: by 2002:a2e:be2b:0:b0:333:b1c4:4d8e with SMTP id
 38308e7fff4ca-33650f9e9c7mr1818881fa.35.1755814694915; Thu, 21 Aug 2025
 15:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821215703.869628-1-robh@kernel.org>
In-Reply-To: <20250821215703.869628-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 00:18:04 +0200
X-Gm-Features: Ac12FXxrs--F6z9RMfNLzTHaN2eK8D_83wEqiGwNidiDTMP6YOpUfEK7YMZn4RM
Message-ID: <CACRpkdZMJ-wY-jtonjJaNufGG3L_OhA4_CeWqfODto-TAHhEVQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: Fix Xicor X1205 vendor prefix
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 11:57=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> The vendor for the Xircom X1205 RTC is not Xircom, but Xicor which was
> acquired by Intersil.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Aw shoot. My misspelling.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

