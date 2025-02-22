Return-Path: <linux-rtc+bounces-3247-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1359FA407FE
	for <lists+linux-rtc@lfdr.de>; Sat, 22 Feb 2025 12:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3ABF422927
	for <lists+linux-rtc@lfdr.de>; Sat, 22 Feb 2025 11:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC5620A5E5;
	Sat, 22 Feb 2025 11:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nTg1x/SB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F631FFC5A
	for <linux-rtc@vger.kernel.org>; Sat, 22 Feb 2025 11:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740224513; cv=none; b=UaYA3/V4R+NdvBhtELmAyXL2xUMOL1hCx7Z6qUqUe3ibxao6pVATVNjaYDHGzhOoagcqCqubmMGoL4cdABdKHrp0VFlhcSklvLywRSzlSjBAJ8KKkV44hP4fpdITnnK8iw0Q70VVseMzhtRBKLS8k0G7rnYYvOzHNgO9KI4rZDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740224513; c=relaxed/simple;
	bh=vu/VIs7YG3zkVFX2YaEP85DPSJetV9jQwZiEvU6CoKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JpVQehZWwbHYLAD29MZMuDQj6fyd/3X5jQakRAhR70UzpzuLd3MzncJfSX7otgdLfb70+CZamoJDFx8eP3lFyZUdpTUuXt++nB7cUkwpS6P5d1IBK0exSRNxqhmGBdKLUyKe0niUD1E6IYWLMk2EUqIQ2/ZTcGbpaKq5UK/DPaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nTg1x/SB; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dfb26020dbso467150a12.3
        for <linux-rtc@vger.kernel.org>; Sat, 22 Feb 2025 03:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740224510; x=1740829310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pg9OSIRa3mJDiRSNRlfM9UaUu3vkBxr1oQN9bQqTEQM=;
        b=nTg1x/SBlPQiOwv6liDXWGl0U6b+AOWu1rJzpCCxGDN6slWlw6ySmc7T1j0W3psluG
         QGeljcZ4melubbz3fN0N46bnCWCnvquwPp0ELzgGrHR8NS5B6M7c49hgM6ywukEBd6LM
         Bp4dQiyoCgEbKtSC5b9X61AOp21XwIzXd9thk6cv6f9lZbWBDYm0qH2xGUnNOHFPp+gE
         RHkYOrghNDNrNneONlFmFYvTaylEIkP+mOeQgfgnGPLYeBMvvFCxsNX3pdFHXspHCZrP
         pxoB3BJ5a+nV9ibGr3YOBaxXpEDfxgvO6ih3ou6hBbetMdlgmhOA7zTIHHjLgTvk6bdw
         zvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740224510; x=1740829310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pg9OSIRa3mJDiRSNRlfM9UaUu3vkBxr1oQN9bQqTEQM=;
        b=MTAjNUkwDyI0E35XUnoWBV2erdNtCCYid1yw4V0pvLbCTLODDuPJPibZrXpk0siqi5
         jTXn1BJ7SlYx7B7AZUmvDpeBmapGKQ+L/R0aIksxBAc/SpijqXLWkk/WAI44PEISaIKZ
         899iyDXIHZfI9uanw1ZeqN00q7eJFScH7Dg/Pi/disfvLgTBJUr8nq5h9CtSk5wwOvLG
         xKrS8I8539gLXeCH1+WMiWKv9qjqjlHR9J/EgISUIsLyKw1EqkgUbd/N6csU+XyIgcEL
         vnfvhjlHwx88tVs+t1Ch6gmNU+2DM8Kh81B2Ghjg/tGDyLxamDSJU9uwpkLHl48B3B6b
         jVLg==
X-Forwarded-Encrypted: i=1; AJvYcCXo0XP6LL3vpzoEfvohs/OtHXSwB/pRPbmS0lFVnnqGU/TMOQHSVCI0ck68jvgOibVlLRIGfrIRp0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxOSRk8YHXNOwmn609XbaCpoGG9iN2y0RVXjwJu/hMiF7V/1mZ
	bEaVU+2Q3dp6XiaPvUPQRNEczEuTtCFRLzIP4SBE/7mLEVpu24qIFJU7UJIV0+cmtEivRVvbbFQ
	vnqw=
X-Gm-Gg: ASbGncv/FMNN+29PmE/OrKAWnbyijG7Q+TahpNW+dFWM/1gEhTeGqhl6rxfaAAnI4/+
	sO9+qKrcslp/+cqQsxBNYoOSA2bfZD3RkcP2g/X7Kat7osP8AZdk42JL9cxC+d7smdagTWOqzmV
	jmN3WDLi5AoOsvzc+BDQ9reh5KlOPSPHOHDCo++mNzjTjNz3EMlFjaqsdrD1/rLU3x+SsAg4sje
	Fjddk6u/cbF0gAA0akWCBmJqXh6TKcOxGeSpBEFTzPXodz3aEqeE/pTAZ7StV7rE7NYaUyC7zx9
	K8Bx0KkGpAiUr7QlWRe1Z+rA5UnVFY8bElvHKGZkIYCCZK9hA8dKjQbiQumbiOfnNUS3svxbc88
	=
X-Google-Smtp-Source: AGHT+IExcHQtiDKMj+mN+X979lYdCH5vPGkYda6XClGheig67KnUK/FsbB2QwJpX8ZpAkABrcL+YIw==
X-Received: by 2002:a17:907:7f9e:b0:abb:e7b0:5437 with SMTP id a640c23a62f3a-abc096c807fmr265884266b.0.1740224510499;
        Sat, 22 Feb 2025 03:41:50 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5337634bsm1852663066b.91.2025.02.22.03.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 03:41:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] rtc: fsl-ftm-alarm: Mark acpi_id table as maybe unused
Date: Sat, 22 Feb 2025 12:41:45 +0100
Message-ID: <20250222114146.162835-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For !ACPI builds, the acpi_device_id table will not be referenced
because of ACPI_PTR:

  rtc-fsl-ftm-alarm.c:312:36: error: unused variable 'ftm_imx_acpi_ids' [-Werror,-Wunused-const-variable]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index a72c4ad0cec6..c8015f04c71f 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -309,7 +309,7 @@ static const struct of_device_id ftm_rtc_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ftm_rtc_match);
 
-static const struct acpi_device_id ftm_imx_acpi_ids[] = {
+static const struct acpi_device_id ftm_imx_acpi_ids[] __maybe_unused = {
 	{"NXP0014",},
 	{ }
 };
-- 
2.43.0


