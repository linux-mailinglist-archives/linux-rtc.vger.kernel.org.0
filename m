Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2464A6073C0
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Oct 2022 11:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbiJUJRW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Oct 2022 05:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbiJUJRO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Oct 2022 05:17:14 -0400
X-Greylist: delayed 165 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 21 Oct 2022 02:16:59 PDT
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA08817E227
        for <linux-rtc@vger.kernel.org>; Fri, 21 Oct 2022 02:16:59 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.134.neoplus.adsl.tpnet.pl [95.49.29.134])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 2255F1F534;
        Fri, 21 Oct 2022 11:16:21 +0200 (CEST)
Message-ID: <8443ca29-ea0f-f209-e3f6-20eca969ea7c@somainline.org>
Date:   Fri, 21 Oct 2022 11:16:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 11/11] arm: dts: qcom: mdm9615: remove useless amba
 subnode
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v4-11-dac2dfaac703@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v4-11-dac2dfaac703@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 21.10.2022 11:06, Neil Armstrong wrote:
> The separate amba device node doesn't add anything significant to the
> DT. The OF parsing code already creates amba_device or platform_device
> depending on the compatibility lists.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
If we ever wanted to do split buses, per-NoC nodes would make sense, but
as you mentioned, this does not, really.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm/boot/dts/qcom-mdm9615.dtsi | 78 +++++++++++++++++--------------------
>  1 file changed, 36 insertions(+), 42 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> index 9d950f96280d..482fd246321c 100644
> --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> @@ -314,49 +314,43 @@ sdcc2bam: dma-controller@12142000{
>  			qcom,ee = <0>;
>  		};
>  
> -		amba {
> -			compatible = "simple-bus";
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			ranges;
> -			sdcc1: mmc@12180000 {
> -				status = "disabled";
> -				compatible = "arm,pl18x", "arm,primecell";
> -				arm,primecell-periphid = <0x00051180>;
> -				reg = <0x12180000 0x2000>;
> -				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
> -				clock-names = "mclk", "apb_pclk";
> -				bus-width = <8>;
> -				max-frequency = <48000000>;
> -				cap-sd-highspeed;
> -				cap-mmc-highspeed;
> -				vmmc-supply = <&vsdcc_fixed>;
> -				dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
> -				dma-names = "tx", "rx";
> -				assigned-clocks = <&gcc SDC1_CLK>;
> -				assigned-clock-rates = <400000>;
> -			};
> +		sdcc1: mmc@12180000 {
> +			status = "disabled";
> +			compatible = "arm,pl18x", "arm,primecell";
> +			arm,primecell-periphid = <0x00051180>;
> +			reg = <0x12180000 0x2000>;
> +			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
> +			clock-names = "mclk", "apb_pclk";
> +			bus-width = <8>;
> +			max-frequency = <48000000>;
> +			cap-sd-highspeed;
> +			cap-mmc-highspeed;
> +			vmmc-supply = <&vsdcc_fixed>;
> +			dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
> +			dma-names = "tx", "rx";
> +			assigned-clocks = <&gcc SDC1_CLK>;
> +			assigned-clock-rates = <400000>;
> +		};
>  
> -			sdcc2: mmc@12140000 {
> -				compatible = "arm,pl18x", "arm,primecell";
> -				arm,primecell-periphid = <0x00051180>;
> -				status = "disabled";
> -				reg = <0x12140000 0x2000>;
> -				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&gcc SDC2_CLK>, <&gcc SDC2_H_CLK>;
> -				clock-names = "mclk", "apb_pclk";
> -				bus-width = <4>;
> -				cap-sd-highspeed;
> -				cap-mmc-highspeed;
> -				max-frequency = <48000000>;
> -				no-1-8-v;
> -				vmmc-supply = <&vsdcc_fixed>;
> -				dmas = <&sdcc2bam 2>, <&sdcc2bam 1>;
> -				dma-names = "tx", "rx";
> -				assigned-clocks = <&gcc SDC2_CLK>;
> -				assigned-clock-rates = <400000>;
> -			};
> +		sdcc2: mmc@12140000 {
> +			compatible = "arm,pl18x", "arm,primecell";
> +			arm,primecell-periphid = <0x00051180>;
> +			status = "disabled";
> +			reg = <0x12140000 0x2000>;
> +			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc SDC2_CLK>, <&gcc SDC2_H_CLK>;
> +			clock-names = "mclk", "apb_pclk";
> +			bus-width = <4>;
> +			cap-sd-highspeed;
> +			cap-mmc-highspeed;
> +			max-frequency = <48000000>;
> +			no-1-8-v;
> +			vmmc-supply = <&vsdcc_fixed>;
> +			dmas = <&sdcc2bam 2>, <&sdcc2bam 1>;
> +			dma-names = "tx", "rx";
> +			assigned-clocks = <&gcc SDC2_CLK>;
> +			assigned-clock-rates = <400000>;
>  		};
>  
>  		tcsr: syscon@1a400000 {
> 
