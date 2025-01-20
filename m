Return-Path: <linux-rtc+bounces-2966-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF93DA1728B
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 19:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1B377A2126
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 18:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDD51EE013;
	Mon, 20 Jan 2025 18:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="lZNI/+Ul"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740F9186E58;
	Mon, 20 Jan 2025 18:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737396510; cv=none; b=m8XsbK9ehG1cKTnZIPSgICJl+dLoJW78q+U9+7jO68c9xLpW/DfcRR46VBeFf0oIgJTGccFnJKGbCBHh0IeBGHMMw57owx4aZqs52Qi+t46VqEKH73DjvJwdpPq7/4Hb/vnIy01Hs0zKoS2zMCdSDqWTUi/2IZkypKy9E4U/CPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737396510; c=relaxed/simple;
	bh=pB6jznMG0ovYaYW0CBLRUZ0Ehep+P+37cwCpLX/hslo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlTLmMZ+R62s6PV+GQNoGP4xv9xX7EAP63CgpafyITlbSJJf/qbX8+//vJMaIgM/3ikEhGYTj9BnKV5unYFjZqLkuymuc0aUp7zupwV1uBkQddrS4Qa3ticgu4j4osL87IHg18sokHM4YWJIvBkUHwyIBc0w/TgNrvoGWnJCZ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=lZNI/+Ul; arc=none smtp.client-ip=212.227.126.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1737396495; x=1738001295;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=CKWFzIyoZoHN+IebNnLgynWS9gdYeIcO+wqNlnB7ML4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lZNI/+UlnMIu1nzuK3kKqa0N72gV+Kaxpl3/JpumvwsCL8gViyKmzFdTJeGSmmjF
	 V47V4zX1ReSWjUcoZ+z8cBQcZFqlfN07z6069Sb8Ii8IoYSCNT0RCuEZ+KJt98Fxm
	 BAPbYKWHYMyTPedJLZdd+lFLzQE5IZktUuEdE4eV49fteWp9UQhPMYCPHCxXFxgIS
	 /KiTl30PXxoAO+33/22Oy2/JkcjoTaklgbURCTKE2Hjio8KjWr1I2F3ibVsL75n+v
	 Eqamjwpy7eW624GZY9qqTyvYOltRZmPaLTa8Le6sWPh4BbQ5KuSA/Vs+R+AYbpYn0
	 5WBX6QIdDC1S3kI4Tw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.152] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mxlio-1tIooj1dPy-0129oR; Mon, 20 Jan 2025 19:08:15 +0100
Message-ID: <0abde047-7f9b-470b-8b16-74e6230a541b@oldschoolsolutions.biz>
Date: Mon, 20 Jan 2025 19:08:14 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sc8280xp-x13s: switch to uefi rtc
 offset
To: Johan Hovold <johan+linaro@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <20250120144152.11949-7-johan+linaro@kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250120144152.11949-7-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jlX3qOxhisU1giQRAaE/kOYQOTcwb0mFPk195YinYjqD58psWzl
 IvgGMZyIF8A22SDxENrMjsqLjDjbq2WEQUJIkNYvgL+bSHKsfVzC4Jazpp0+sv6uWrBUJik
 EGazRmHjkegAfj34sl+CGXBCeqEAPqYAxFH7DslVorA6L9TyjH1uiQXVPH1Itekh6qysk/+
 NPSy6V0gVTNNWjtYTIzfA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mPcmZq2eW1Q=;Xs+hBq8FcvdE5YFUvAp5/361Z3u
 HcB1P6hxZgYXVVyISklKLT0Vb14Gvzxxs4oWTsmPZz94DnWbCbfZ69hFxLofSP0DqbXOuJb61
 BNQasC/8eZR9HAqdYQf8w5fpmZxIeXzILWaYlSOysjldGFo7FiMThSpfNompA/5vnVEq9KJvU
 S8RhDJuLPkk06FlCNE3yLTl+1ZcOGn7q6yxXf/qZnYwVKLwoE/tKBQZfFVtJ7zjpuyR0KgJcC
 dPRoPz4t9OunNvy0LwMDcS2jF+WLp/JfRjlKtC+enRXLENCDJSmfsA7PO23OoLm41xFcJlWXX
 LqwtYT+yIM7BVBeFwlOHr62nRU0evtCfC+hqyQHMl71G6/fkl8uUOA30mihGDiNx3cXcYqmnD
 nyklSdd8jVF8EfMJZ1YKbA+R/EkDyUDjO91s7yW+6Db3RG2wMLIUk+TaUvOh5MYsBvcJZjVGO
 jSnSFKTVdCsWzsvu+Z17oj+iQKSjtixd9YoOMLCNtqezMf12IIxCFUuL5aeEpDftkI6i2iT/1
 V0OlKmaxWvuaZyEd1vket3VnMQBl21XXWlyTligUgWgvgE68Y01z4xtUsxJnn3QHHZKaolrOC
 +FeKOMWJTL0erWTEBII/SPcSnAFqC/17+ojA6FNEuN68ER+IMXLYnVrVH67FE4ZxVeZSaafdS
 X+rVVef/IzT9O1VyTGH8N6nCBTDhrTyTKpYcQJ8DlEFnU24GXe/4i7EAzbPhyMdsbhin5pOHW
 uDG0jW8T/eiWiE/5YqokJkoU3GSj0GCWmQnBIabv5vcLaNf8w4fK4shbXypSkVdGamfOF5XQs
 qMFQE1lg4MAP0JW4bCyPaAEFd/a7Pmm8sqK3sazsGdoSb+qLhgW2F5eGtVtUS3xsfaQewLqd5
 4bCLJukWpi7NsL7rexW8p7J7acYhe/a3MLJCJW1yaU/2XixVJt6DKv7BJu8WyLE6qM8K8NDuK
 e29wSpFaetMvV/WoxMDoDRWmii7gwKO0gxj2wBX/AeNkoo9tO9YuzXla8X4MlCSqoTtg+0F2M
 JtI6yKpFBd0f6AG8Qa3rRUehJrZ2cMHSWifXrURCFvL3ua9Xr/KN0U1KRQb8Kze0OoC/ltggl
 1vOz6mDgKzvyapPnaziXfl6L+5nsC7k9umZIIaXwM+HQVOC006+xKRDxQBHcoDRVQrPDNUDAs
 =

Hi Johan,

On 20.01.25 15:41, Johan Hovold wrote:
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which a
> driver can take into account.
>
> Switch to using the Qualcomm specific UEFI variable that is used by the
> UEFI firmware (and Windows) to store the RTC offset.
>
> This specifically means that the RTC time will be synchronised between
> the UEFI firmware setup (or UEFI shell), Windows and Linux.
>
> Note however that Windows stores the RTC time in local time by default,
> while Linux typically uses UTC (i.e. as on X86).
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts   | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts =
b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 38d911992475..66c39765225f 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -1090,20 +1090,11 @@ &pmk8280_pon_resin {
>   };
>
>   &pmk8280_rtc {
> -	nvmem-cells =3D <&rtc_offset>;
> -	nvmem-cell-names =3D "offset";
> +	qcom,uefi-rtc-info;
>
>   	status =3D "okay";
>   };
>
> -&pmk8280_sdam_6 {
> -	status =3D "okay";
> -
> -	rtc_offset: rtc-offset@bc {
> -		reg =3D <0xbc 0x4>;
> -	};
> -};
> -
>   &pmk8280_vadc {
>   	channel@144 {
>   		reg =3D <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;

Nice. I have it running on my X13s now, looks to work fine. Also ported
to Windows Dev Kit 2023, patch will follow soon after testing it. Thanks!

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens


